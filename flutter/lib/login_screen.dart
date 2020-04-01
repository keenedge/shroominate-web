import 'package:flutter/material.dart';
import 'package:shroominate/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                AuthService().signInWithEmail( "gtissington@gmail.com", "Paragl1d3" );
              },
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: () async {
                bool res = await AuthService().signInWithGoogle();
                if( !res ) {
                  print( "Login error");
                }
              },
              child: Text("Google"),
            ),
          ],
        ),
      ),
      
    );
  }
}