import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  MainCard(
      {@required this.color,
      @required this.childWidget,
      @required this.onPressed});

  final Color color;
  final Widget childWidget;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}
