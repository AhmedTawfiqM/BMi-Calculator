import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 40,
      ),
      backgroundColor: colorCardActive,
    );
  }
}
