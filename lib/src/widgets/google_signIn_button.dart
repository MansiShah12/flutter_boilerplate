import 'package:flutter/material.dart';
import '../services//googleSignIn.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import '../screens/Navigators/BottomTabNavigation/index.dart';
class GoogleSigninButton extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return GoogleSignInButton(
      onPressed:  ()async {
        var signed = await GoogleSigning.signInWithGoogle();
        if(signed){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomTab(),
              ));
        }else{
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
  }
      },
      darkMode: true,
    );
  }
}

