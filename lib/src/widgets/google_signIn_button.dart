import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_boilerplate/src/actions/actions.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GoogleSigninButton extends StatefulWidget {
  @override
  _GoogleSigninButton createState() => new _GoogleSigninButton();
}

class _GoogleSigninButton extends State<GoogleSigninButton> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return GoogleSignInButton(
            onPressed: () {
              print("in ViewModelllll");
              viewModel.login();
            },
            darkMode: true,
          );
        });
  }
}

class _ViewModel {
  final Function login;

  _ViewModel({
    this.login,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(login: () {
      print("in Loginnnnnnnn,${store.state}");
      store.dispatch(Login(login: null));
    });
  }
}
