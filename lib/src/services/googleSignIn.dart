import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class GoogleSigning{
 static Future<String> signInWithGoogle() async {
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
  }

}