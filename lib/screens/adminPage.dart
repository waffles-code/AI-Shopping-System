import 'dart:ui';
import 'package:aishop/theme.dart';
import 'package:aishop/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import '../theme.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  final List<Feature> features = [
    Feature(
      title: "Clothes",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      title: "Kichen",
      color: Colors.black,
      data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
    ),
    Feature(
      title: "Tech",
      color: Colors.orange,
      data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
    ),
    Feature(
      title: "Books",
      color: Colors.red,
      data: [0.5, 0.2, 0, 0.3, 1, 1.3],
    ),
    Feature(
      title: "Shoes",
      color: Colors.green,
      data: [0.25, 0.6, 1, 0.5, 0.8, 1, 4],
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: MyAppBar(
        title: Text(
          'ACCURANCY PAGE',
        ),
        context: context,
      ),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 60,
          ),
          new CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center: new Text(
              "70.0%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "Product's Accurany ",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: Text(
                    "Category's Accurancy",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                LineGraph(
                  features: features,
                  size: Size(420, 450),
                  labelX: [
                    'Day 1',
                    'Day 2',
                    'Day 3',
                    'Day 4',
                    'Day 5',
                    'Day 6'
                  ],
                  labelY: ['35%', '45%', '59%', '70%', '83%', '98%'],
                  showDescription: true,
                  graphColor: Colors.black87,
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
