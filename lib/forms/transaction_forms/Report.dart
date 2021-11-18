// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class View_Report extends StatefulWidget {
  @override
  _View_ReportState createState() => _View_ReportState();
}

class _View_ReportState extends State<View_Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Flexible(child: CardList()),
          ],
        ),
      ),
    );
  }
}

Widget CardList() {
  return SingleChildScrollView(
    child: Card(
      child: ExpansionTile(
        iconColor: Colors.lightGreen.shade900,
        collapsedBackgroundColor:Colors.white,
        title: Text(
          "Farm A",
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
            color: Colors.lightGreen.shade900,
          ),
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              "Number Of Chicks : 100",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Total Dead : 12",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Average Weight : 850",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
