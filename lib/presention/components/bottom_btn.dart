import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.red,
        height: 80,
        child: Center(
            child: Text(
              text,
              style: styleLabelSemiBold,
            )),
      ),
    );
  }
}