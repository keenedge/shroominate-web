import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shroominate/auth_service.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shroominate"),
          actions: <Widget>[
            // IconButton(
            //   onPressed: () {
            //     AuthService().signOut();
            //   },
            //   icon: FaIcon(FontAwesomeIcons.signOutAlt),
            // ),
            // IconButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   icon: FaIcon(FontAwesomeIcons.home),
            // )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("Measurements")
                .orderBy('timestamp', descending: true)
                .limit(120)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return Text("Loading...");


              // var seriesList = makeSeries(snaps hot.data.documents);
            return Wrap(children: <Widget>[
                  SizedBox(height: 400, width: 400,
                    child: charts.TimeSeriesChart(
                      _createSeries(snapshot.data.documents, 'co2'), 
                      animate: false,
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                          new charts.BasicNumericTickProviderSpec(zeroBound: false)),
                      dateTimeFactory: const charts.LocalDateTimeFactory(),)
                  ),
                  SizedBox(height: 400, width: 400,
                    child: charts.TimeSeriesChart(
                      _createSeries(snapshot.data.documents, 'temperature'), 
                      animate: false,
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                          new charts.BasicNumericTickProviderSpec(zeroBound: false)),
                      dateTimeFactory: const charts.LocalDateTimeFactory(),)
                  ),
                  SizedBox(height: 400, width: 400,
                    child: charts.TimeSeriesChart(
                      _createSeries(snapshot.data.documents, 'humidity'), 
                      animate: false,
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                        tickProviderSpec:
                          new charts.BasicNumericTickProviderSpec(zeroBound: false)),
                      dateTimeFactory: const charts.LocalDateTimeFactory(),)
                  ),
            ]);
              }));
  }

  static List<charts.Series<LinearMeasurement, DateTime>> _createSeries( List<DocumentSnapshot> docs, String variable) {
    // final data = [
    //   new LinearMeasurement(0, 5, 0, 1),
    //   new LinearMeasurement(1, 25, 0, 1),
    //   new LinearMeasurement(2, 100, 0, 1),
    //   new LinearMeasurement(3, 75, 0, 1),
    // ];
    final data = docs.map((e) => LinearMeasurement(e["timestamp"].toDate(), e[variable])).toList(); 
    return [
      new charts.Series<LinearMeasurement, DateTime>(
        id: variable,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearMeasurement m, _) => m.timestamp,
        measureFn: (LinearMeasurement m, _) => m.value,
        data: data,
      )

    ];
  }
}

class LinearMeasurement {
  // final DateTime timestamp;
  final DateTime timestamp;
  final double value;

  LinearMeasurement(this.timestamp, this.value);
}
