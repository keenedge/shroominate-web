import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shroominate/home_screen.dart';
import 'package:shroominate/login_screen.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signInWithEmail(String email, String password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignIn google = GoogleSignIn();
      GoogleSignInAccount account = await google.signIn();
      if (account == null) {
        return false;
      }
      AuthResult res = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: (await account.authentication).idToken,
              accessToken: (await account.authentication).accessToken));

      if (res.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }

  }
}
