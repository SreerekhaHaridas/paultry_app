// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final kBoxdecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(
        6.0,
        6.0,
      ),
    ),
  ],
);
final dBoxdecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    bottomRight: Radius.circular(0.0),
    bottomLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black38,
      offset: Offset(
        5.0,
        5.0,
      ),
    ),
  ],
);
final cardstyle = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ));
final headingTextStyle =
    TextStyle(color: Colors.black, fontFamily: 'OpenSans', fontSize: 18);

final headingStyleWhite =
    TextStyle(color: Colors.black, fontFamily: 'OpenSans', fontSize: 22);

final flatbuttonColor = Colors.white;

final gradient = LinearGradient(
  colors: [Colors.black, Colors.cyan],
);
