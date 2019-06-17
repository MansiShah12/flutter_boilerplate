import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/user_action.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/screens/ImageSwiper/image_swiper.dart';
import 'package:flutter_boilerplate/src/screens/InAppPurchase/index.dart';
import 'package:flutter_boilerplate/src/screens/LoginScreen/login_screen.dart';
import 'package:flutter_boilerplate/src/screens/MapScreen/maps.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/BottomTabScreens/setting_screen.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/TabBarNavigation/TabBarScreens/user_screen.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_boilerplate/src/services/firebase_config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DrawerBar extends StatelessWidget {
  final firebaseReference = FirebaseReference().databaseReference;

  onDeleteAccountPressed(context, viewModel) async {
    String email = viewModel.userdata.data;
    var db = firebaseReference.child("Users");
    await db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (values["email"] == email) {
          print("valuesvalue $viewModel");
          firebaseReference
              .reference()
              .child("Users")
              .child("$key")
              .remove()
              .then((_) {
            print("Delete successful");
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text(" Account Successfully deleted"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Ok"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ));
                    },
                  ),
                ],
              );
            },
          );
         }
      });
    });

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ));
  }

  _onDrawerTileTap(context, title, viewModel) async {
    switch(title) { 
   case 'Logout': { 
       String signInMethod = viewModel.userdata.signInMethod;
      viewModel.logout(signInMethod);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          )); 
   } 
   break; 
  
   case 'Map': { 
     Navigator.pop(context); 
     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Maps(fromTab: false),
              ));
   } 
   break;
   case 'Images': { 
     Navigator.pop(context); 
      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ImageSwiper(fromTab: false),
              ));
              
   }
   break;
   case 'Settings': { 
      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SettingScreen(fromTab: false),
              ));
   }
   break;
   case 'In-App Purchase': { 
      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>InAppPurchase() ,
              )); 
   }
   break;
   case 'My Profile': { 
      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => UserDetails(),
              )); 
   }
   break; 
   case 'Delete Account': { 
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
                "Do you really want to delete Account from this App ?"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("yes"),
                onPressed: () {
                  onDeleteAccountPressed(context, viewModel);
                },
              ),
              new FlatButton(
                child: new Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
   }
   break;
      
   default: { 
      Navigator.pop(context);
   }
   break; 
}
}

  _drawerList(context, title, icon, viewModel) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          _onDrawerTileTap(context, title, viewModel);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Drawer(
              elevation: 20.0,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName:
                        Text(' Flutter ', style: TextStyle(fontSize: 30)),
                    accountEmail: Text('flutter@gmail.com',
                        style: TextStyle(fontSize: 20)),
                    currentAccountPicture: Center(
                      child: Image.network(
                          'https://pbs.twimg.com/profile_images/1022518859906142208/NI18dlQg_400x400.jpg'),
                    ),
                    decoration: BoxDecoration(color: Colors.blueAccent),
                  ),
                  _drawerList(
                      context, 'My Profile', Icons.account_circle, viewModel),
                  _drawerList(context, 'Images', Icons.image, viewModel),
                  _drawerList(context, 'Map', Icons.map, viewModel),
                  _drawerList(context, 'Settings', Icons.settings, viewModel),
                  _drawerList(context, 'Logout', Icons.arrow_back, viewModel),
                  _drawerList(
                      context, 'In-App Purchase', Icons.shopping_basket, viewModel),
                      _drawerList(
                      context, 'Delete Account', Icons.delete, viewModel),

                ],
              ));
        });
  }
}

class _ViewModel {
  final Function logout;
  final UserDataState userdata;

  _ViewModel({
    this.logout,
    @required this.userdata,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        logout: (signInMethod) {
          store.dispatch(LogOutUser(
              email: '', loggedIn: false, signInMethod: signInMethod));
        },
        userdata: userDataStateSelector(store.state));
  }
}
