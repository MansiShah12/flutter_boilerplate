import 'package:flutter/material.dart';
import '../services/googleSignIn.dart';

class GoogleSignInButton extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            GoogleSigning.signInWithGoogle();
          },
          child: Row(
            children: <Widget>[
             SizedBox(
                    height: 20.0,
                    child: Image.asset(
                      "assets/googleSignIn.png",
                      fit: BoxFit.contain,
                    ),
                  ),
              Text("SignIn with Google",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
