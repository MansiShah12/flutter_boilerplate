import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/user_action.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class FacebookSigninButton extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  onPressCalled (context, viewModel) {
    viewModel.login(context, 'facebook');
    }

  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return FacebookSignInButton(onPressed: () async {
            onPressCalled(context, viewModel);
          });
        });
  }
}

class _ViewModel {
  final Function login;
  final UserDataState userdata;

  _ViewModel({
    this.login,
     @required this.userdata,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(login: (context,signInMethod) {
      store.dispatch(Login(isLoading: true, context:context,signInMethod:signInMethod));
      },
      userdata: userDataStateSelector(store.state));
   }
  }
