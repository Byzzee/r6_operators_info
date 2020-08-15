import 'package:flutter/material.dart';


final ThemeData appTheme = ThemeData(
  primaryColor: Color.fromRGBO(35,38,44,1.0),
  accentColor: Color.fromRGBO(35,38,44,1.0),
  backgroundColor: Color.fromRGBO(51,55,64,1.0),
  scaffoldBackgroundColor: Color.fromRGBO(51,55,64,1.0) ,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold))
);