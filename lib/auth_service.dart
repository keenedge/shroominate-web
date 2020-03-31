import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class AuthService {
  signOut() {
    FirebaseAuth.instance.signOut();
  }
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if( snapshot.hasData ){
          return HomePage();
        } else {
          return LoginPage(); 
        }
      }
    );
  }

  signIn( String email, String password ) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((user){
      print("Signed in");
    }).catchError((e){
      print( e );

    });
  }
}