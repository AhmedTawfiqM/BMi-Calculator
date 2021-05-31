import 'package:bmi_calculator/data/CalculatorBrain.dart';
import 'package:bmi_calculator/data/constants.dart';
import 'package:bmi_calculator/presention/components/AppTheme.dart';
import 'package:bmi_calculator/presention/components/bottom_btn.dart';
import 'package:bmi_calculator/presention/components/main_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().build(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator")),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: Text("Your Results", style: styleLabelSemiBold),
              ),
              MainCard(
                color: colorCardActive,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(statusBmi(), style: styleLabelGreen),
                    Text(resultBmi(), style: styleLabelFullBold),
                    Padding(
                      child: Text(interpretation(), style: styleLabel),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              BottomButton(
                text: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String statusBmi() => calculatorBrain.getStatus();

  String resultBmi() => calculatorBrain.resultBMI();

  String interpretation() => calculatorBrain.getInterpretation();
}
