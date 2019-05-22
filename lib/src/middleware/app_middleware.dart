import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/fetch_beer_action.dart';
import 'package:flutter_boilerplate/src/models/beer.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:flutter_boilerplate/src/services/beerService.dart';
import 'package:flutter_boilerplate/src/services/facebookSignIn.dart';
import 'package:flutter_boilerplate/src/services/index.dart';
import '../actions/actions.dart';
import '../models/app_state.dart';
import '../services/googleSignIn.dart';

import 'package:redux/redux.dart';

class AppMiddleware {
  List<Middleware<AppState>> createMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Login>(_loginUser),
      TypedMiddleware<AppState, FetchBeer>(_fetchBeer),
    ];
  }

  void _loginUser(
      Store<AppState> store, Login action, NextDispatcher next) async {
    store.dispatch(UserLoading(isLoading: true));
    String email;
    String signInMethod = action.signInMethod;
    print("in middleware ${action.signInMethod}");
    var context = action.context;
    if (signInMethod == 'google') {
      email = await GoogleSigning.signInWithGoogle();
    } else {
      email = await initiateFacebookLogin();
    }
    if (email != '') {
      store.dispatch(LoginSuccessfull(email: email));
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
