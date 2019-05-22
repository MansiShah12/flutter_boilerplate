import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

Future<String> initiateFacebookLogin() async {
  var facebookLogin = FacebookLogin();
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
          'https://graph.facebook.com/v2.12/me?fields=email&access_token=${facebookLoginResult.accessToken.token}');

      var userprofile = json.decode(graphResponse.body);
      var profile = userprofile.toString();
      return ('email');
      break;
  }
}
