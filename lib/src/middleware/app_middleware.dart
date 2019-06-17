import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/fetch_beer_action.dart';
import 'package:flutter_boilerplate/src/models/beer.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:flutter_boilerplate/src/services/beerService.dart';
import 'package:flutter_boilerplate/src/services/facebookSignIn.dart';
import 'package:flutter_boilerplate/src/services/firebase_config.dart';
import '../actions/user_action.dart';
import '../models/app_state.dart';
import '../services/googleSignIn.dart';

import 'package:redux/redux.dart';

class AppMiddleware {
  List<Middleware<AppState>> createMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Login>(_loginUser),
      TypedMiddleware<AppState, FetchBeer>(_fetchBeer),
      TypedMiddleware<AppState, LogOutUser>(_logOutUser),
    ];
  }

  final firebaseReference = FirebaseReference().databaseReference;

  void _loginUser(
      Store<AppState> store, Login action, NextDispatcher next) async {
    store.dispatch(UserLoading(isLoading: true));
    String email;
    String name;
    String signInMethod = action.signInMethod;
    var userprofile;
    print("in middleware ${action.signInMethod}");
    var context = action.context;
    if (signInMethod == 'google') {
      userprofile = await GoogleSigning.signInWithGoogle();
    } else {
      userprofile = await initiateFacebookLogin();
    }
    Map decodedMap = json.decode(userprofile);
    email = decodedMap['email'];
    name = decodedMap['name'];
    if (email != '') {
      var time = new DateTime.now().millisecondsSinceEpoch;
      firebaseReference
          .child("Users")
          .child('$time')
          .set({'name': name, 'email': email});

      store
          .dispatch(LoginSuccessfull(email: email, signInMethod: signInMethod));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BottomTab(),
          ));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("Log In Failed"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      next(action);
    }
  }

  void _logOutUser(
      Store<AppState> store, LogOutUser action, NextDispatcher next) async {
    store.dispatch(UserLoading(isLoading: true));
    bool loggedIn;
    String signInMethod = action.signInMethod;
    if (signInMethod == 'google') {
      loggedIn = await GoogleSigning.signOut();
    } else if (signInMethod == 'facebook') {
      loggedIn = await facbookLogout();
    }
    if (!loggedIn) {
      store.dispatch(LogOutSuccessfull(email: '', signInMethod: ''));
    }
  }

  void _fetchBeer(
      Store<AppState> store, FetchBeer action, NextDispatcher next) async {
    List<Beer> _beers = [];
    final Stream<Beer> stream = await getBeers();

    await for (Beer beer in stream) {
      _beers.add(beer);
    }

    store.dispatch(FetchBeerSuccessfull(beers: _beers));
  }
}
