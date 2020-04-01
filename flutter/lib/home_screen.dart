import 'package:flutter/material.dart';
import 'package:shroominate/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Text("Sign out"),
            ),
          ),
        ],
      ),
    );
  }
}