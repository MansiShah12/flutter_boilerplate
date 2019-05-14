import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/actions.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/screens/LoginScreen/login_screen.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DrawerBar extends StatelessWidget {
  _onDrawerTileTap(context, title,viewModel ) async{
    if (title == "Logout") {
      await viewModel.logout();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ));
    } else
      Navigator.pop(context);
  }

  _drawerList(context, title, icon,viewModel) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          _onDrawerTileTap(context, title,viewModel);
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
                  _drawerList(context, 'My Profile', Icons.account_circle,viewModel),
                  _drawerList(context, 'Images', Icons.image,viewModel),
                  _drawerList(context, 'Map', Icons.map,viewModel),
                  _drawerList(context, 'Settings', Icons.settings,viewModel),
                  _drawerList(context, 'Logout', Icons.arrow_back, viewModel),
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
        logout: () {
          store.dispatch(LogOutUser(email: '', loggedIn: false));
        },
         userdata: userDataStateSelector(store.state)
        );
  }
}
