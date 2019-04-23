import 'package:flutter/material.dart';
import '../services/googleSignIn.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class FacebookSigninButton extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return FacebookSignInButton(onPressed: () {
  // call authentication logic
});
  }
}

