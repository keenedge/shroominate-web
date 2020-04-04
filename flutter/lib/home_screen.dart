// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shroominate/auth_service.dart';
import 'package:shroominate/chart_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   List<Widget> _buildCells(List<DocumentSnapshot> docs) {
//     return List.generate(
//       docs.length,
//       (index) => Container(
//         alignment: Alignment.center,
//         width: 120.0,
//         height: 60.0,
//         color: Colors.white,
//         margin: EdgeInsets.all(4.0),
//         child: Text(docs[index].data["timestamp"].toDate().toString(),
//             style: Theme.of(context).textTheme.headline6),
//       ),
//     );
//   }

//   List<Widget> _buildRows(List<DocumentSnapshot> docs) {
//     return List.generate(
//       docs.length,
//       (index) => Row(
//         children: _buildCells(docs),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shroominate"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                AuthService().signOut();
              },
              icon: FaIcon(FontAwesomeIcons.signOutAlt),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartPage()),
                );
              },
              icon: FaIcon(FontAwesomeIcons.chartLine),
            )
          ],
        ),
        body: Text("Home")
    );
  }
}