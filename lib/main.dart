import 'package:bmi_calculator/presention/components/AppTheme.dart';
import 'package:flutter/material.dart';
import 'presention/screens/main_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().build(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: BmiCalculator(),
      ),
    );
  }
}
