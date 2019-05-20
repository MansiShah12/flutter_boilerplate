import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_boilerplate/src/actions/actions.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GoogleSigninButton extends StatefulWidget {
  @override
  _GoogleSigninButton createState() => new _GoogleSigninButton();
}

class _GoogleSigninButton extends State<GoogleSigninButton> {
  
  onPressCalled (context, viewModel) {
    String email = viewModel.userdata.data;
    viewModel.login(context);
     
    
  }
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return GoogleSignInButton(
            onPressed: () {
              onPressCalled(context, viewModel);
              },
            darkMode: true,
          );
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
    return _ViewModel(login: (context) {
        store.dispatch(Login(isLoading: true, context:context));
      },
      userdata: userDataStateSelector(store.state));
   }
  }
