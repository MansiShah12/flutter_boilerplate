import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookLogin = new FacebookLogin();
Future<String> initiateFacebookLogin() async {
  var facebookLoginResult =
      await facebookLogin.logInWithReadPermissions(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print("Errorrrrrrr");
      return "Error";
      break;
    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUserrrrrrrrr");
      return "Cancel";
      break;
    case FacebookLoginStatus.loggedIn:
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,email&access_token=${facebookLoginResult.accessToken.token}');
      var userprofile = json.decode(graphResponse.body);
      var email = '';
      var name = '';
      Map<dynamic, dynamic> values = userprofile;
      values.forEach((key, values) {
        if (key == "email") {
          email = values;
        } else if (key == "name") {
          name = values;
        }
      });
      var data = json.encode({
        'name': name,
        'email': email,
      });
      return (data);
      break;
  }
}

Future<bool> facbookLogout() async {
  facebookLogin.logOut();
  return false;
}