
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
        print("LoggedInnnnnnnnnnnn");
        return ("LoggedIn");
        break;
    }
  }