import 'package:flutter/material.dart';
import 'package:fw/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text( "You are loggged in"),
          SizedBox(
            height: 10.0
          ),
          RaisedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Center( 
              child: Text('sign out'),
            ),
            color: Colors.red,
          ),

        ],
      ),
      
    );
  }
}