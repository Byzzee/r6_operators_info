import 'package:flutter/material.dart';


final ThemeData appTheme = ThemeData(
  primaryColor: Color.fromRGBO(35,38,44,1.0),
  accentColor: Color.fromRGBO(35,38,44,1.0),
  backgroundColor: Color.fromRGBO(51,55,64,1.0),
  scaffoldBackgroundColor: Color.fromRGBO(51,55,64,1.0) ,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
    headline4: TextStyle(color: Colors.white, fontSize: 18.0),
    headline5: TextStyle(color: Colors.white, fontSize: 24.0),
    headline6: TextStyle(color: Colors.white, fontSize: 32.0),
    overline: TextStyle(color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(color: Colors.white, fontSize: 12.0),
    subtitle2: TextStyle(color: Colors.white, fontSize: 16.0),
  )
);