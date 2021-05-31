import 'dart:math';

import 'package:bmi_calculator/core/status_bmi.dart';
import 'package:bmi_calculator/presention/screens/results_page.dart';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height}) {
    _calculateBMI();
  }

  int weight;
  int height;

  double _bmi;

  void _calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
  }

  String resultBMI() => _bmi.toStringAsFixed(1);

  StatusBMI _getResult() {
    if (_bmi >= 25) return StatusBMI.OverWeight;

    if (_bmi >= 18.5) return StatusBMI.Normal;

    return StatusBMI.UnderWeight;
  }

  String getStatus() => _getResult().toString().split('.').last;

  String getInterpretation() {
    if (_bmi >= 25)
      return "You have a higher than normal body weight. Try to exercise more.";

    if (_bmi >= 18.5) return 'You have a normal body weight. Good job!';

    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
