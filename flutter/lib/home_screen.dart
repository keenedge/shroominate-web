import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shroominate/auth_service.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart.dart';

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
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("Measurements").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if( !snapshot.hasData) return Text("Loading");
              return Container(
                child: Column( 
                  children: <Widget>[
                    Text(snapshot.data.documents[0]['Co2'].toString()),
                    Text(snapshot.data.documents[0]['timestamp'].toString()),
                  ]));
              
              // final data = [
              //var x = snapshot.data.documents[0];
              //   snapshot.data.documents[0]["RH"]
              //   snapshot.data.documents[0]["Temp"]
              // ];

              // List<charts.Series> data = [
              //   new charts.Series<DocumentSnapshot, String>(
              //   id: 'Measurements',
              //   colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              //   domainFn: (DocumentSnapshot snapshot, _) => snapshot["timestamp"].toString(),
              //   measureFn: (DocumentSnapshot snapshot, _) => snapshot["Co2"],
              //   data: snapshot.data.documents,
              // )
              // ];


              // return Container(
              //   child: SimpleBarChart( data ),
              //   height: 200, width: 200,
              // );
              //     // Text( ),

            })
        ],
      ),
    );
  }
}

