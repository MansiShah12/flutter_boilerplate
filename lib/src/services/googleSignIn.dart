import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:sentry/sentry.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

final SentryClient _sentry = SentryClient(dsn: "https://5e647fda8f8e48dbbc0ede657a333448:eb4a78f5156740979a60641f6346f475@sentry.io/1458864");

class GoogleSigning{
 static Future<String> signInWithGoogle() async {

try {
    final FirebaseAuth _fAuth = FirebaseAuth.instance;
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print("googleUsergoogleUsergoogleUser: $googleUser");
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
         print("googleAuthgoogleAuthgoogleAuth: $googleAuth");
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
         print("credentialcredentialcredential: $credential");

    final FirebaseUser user = await _fAuth.signInWithCredential(credential);
         print("useruseruseruseruser: $user");

    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _fAuth.currentUser();
    assert(user.uid == currentUser.uid);
    final email= user.email;

return (email);
  } catch(error, stackTrace) {
    _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
    var email='';
    return (email);
  }
  
  }

}