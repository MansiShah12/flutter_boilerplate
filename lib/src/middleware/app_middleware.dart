import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:path/path.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';
import '../services/googleSignIn.dart';

import 'package:redux/redux.dart';

class AppMiddleware {
  List<Middleware<AppState>> createMiddleware() {
    print("in Liststststst");
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Login>(_loginUser),
    ];
  }

  void _loginUser(
      Store<AppState> store, Login action, NextDispatcher next) async {
    store.dispatch(UserLoading(isLoading: true));
    print("in middleware ${action.isLoading}");
    var context= action.context;
    var email = await GoogleSigning.signInWithGoogle();
    if (email != '') {
      store.dispatch(LoginSuccessfull(email: email));
       Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomTab(),
              ));
      } else {
      print("in elssssssssss");
      
      
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         content: new Text("Log In Failed"),
      //         actions: <Widget>[
      //           new FlatButton(
      //             child: new Text("Ok"),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ],
      //       );
      //     },
      //   );
      next(action);
    }
  }
}
