import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shroominate/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Shroominate"),      
        actions: <Widget>[
          IconButton(
            onPressed: () {AuthService().signInWithEmail( "gtissington@gmail.com", "edgewise" );},
            icon: FaIcon(FontAwesomeIcons.signInAlt),),
          IconButton(
            onPressed: () async {
              bool res = await AuthService().signInWithGoogle();
                if( !res ) {
                  print( "Login error");
                }
            },
            icon: FaIcon(FontAwesomeIcons.google),)
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
      
    );
  }
}