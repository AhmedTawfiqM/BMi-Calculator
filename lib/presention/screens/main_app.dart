import 'package:bmi_calculator/core/gender.dart';
import 'package:bmi_calculator/data/CalculatorBrain.dart';
import 'package:bmi_calculator/presention/components/bottom_btn.dart';
import 'package:bmi_calculator/presention/components/card_content.dart';
import 'package:bmi_calculator/presention/components/floating_btn_card.dart';
import 'package:bmi_calculator/presention/components/main_card.dart';
import 'package:bmi_calculator/presention/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/constants.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color _colorMale = colorCardInActive;
  Color _colorFeMale = colorCardInActive;

  //
  Gender _currentGender;
  int _height = 50;
  int weight = 30;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50),
        Expanded(
          child: Row(
            children: [
              MainCard(
                onPressed: () {
                  setState(() {
                    _updateColor(Gender.Male);
                  });
                },
                color: _colorMale,
                childWidget:
                    CardContent(label: "MALE", icon: FontAwesomeIcons.mars),
              ),
              MainCard(
                onPressed: () {
                  setState(() {
                    _updateColor(Gender.Female);
                  });
                },
                color: _colorFeMale,
                childWidget:
                    CardContent(label: "FEMALE", icon: FontAwesomeIcons.venus),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        MainCard(
          color: colorCardInActive,
          childWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEIGHT", style: styleLabel),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(_height.toString(), style: styleLabelBold),
                  Text("cm", style: styleLabel),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.red,
                    overlayColor: Colors.indigo,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                child: Slider(
                  value: _height.toDouble(),
                  min: 50,
                  max: 220,
                  //activeColor: Colors.white,
                  //inactiveColor: Colors.grey,
                  onChanged: (double newValue) {
                    print(newValue.toString());
                    setState(() {
                      _height = newValue.toInt();
                    });
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Row(
            children: [
              MainCard(
                color: colorCardInActive,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: styleLabel),
                    SizedBox(height: 5),
                    Text(weight.toString(), style: styleLabelBold),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingButton(
                          onPressed: () {
                            setState(() {
                              if (weight != 1) weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 5),
                        FloatingButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: Icons.add)
                      ],
                    ),
                  ],
                ),
              ),
              MainCard(
                color: colorCardInActive,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: styleLabel),
                    SizedBox(height: 5),
                    Text(age.toString(), style: styleLabelBold),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingButton(
                          onPressed: () {
                            setState(() {
                              if (age != 1) age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 5),
                        FloatingButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: Icons.add)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          text: "CALCULATE",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              CalculatorBrain calculator = CalculatorBrain(weight: weight, height: _height);
              return ResultsPage(calculatorBrain: calculator,);
            }));
          },
        )
      ],
    );
  }

  void _updateColor(Gender gender) {
    _currentGender = gender;

    if (gender == Gender.Male) {
      if (_colorMale == colorCardActive) {
        _colorMale = colorCardInActive;
      } else {
        _colorMale = colorCardActive;
        _colorFeMale = colorCardInActive;
      }
    }

    if (gender == Gender.Female) {
      if (_colorFeMale == colorCardActive) {
        _colorFeMale = colorCardInActive;
      } else {
        _colorMale = colorCardInActive;
        _colorFeMale = colorCardActive;
      }
    }
  }
}
