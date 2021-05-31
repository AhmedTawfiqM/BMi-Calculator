import 'package:flutter/material.dart';

class AppTheme {
  ThemeData build() {
    return ThemeData(
        primaryColor: Color(0XFF0A0E29),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(body1: TextStyle(color: Color(0XFFFFFFFFF))));
  }

  ThemeData buildDark() {
    return ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(body1: TextStyle(color: Color(0XFFFFFFFFF))));
  }
}
