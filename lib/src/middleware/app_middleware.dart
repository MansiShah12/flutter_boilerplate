import 'package:flutter/material.dart';

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


      void _loginUser(Store<AppState> store, Login action,
      NextDispatcher next) async {
        print("in middleware");
        var email = await GoogleSigning.signInWithGoogle();
        if(email!= null){
         store.dispatch(LoginSuccessfull(email: email));
        }else{
          print("in elssssssssss");
    next(action);
        }
      }

    
}