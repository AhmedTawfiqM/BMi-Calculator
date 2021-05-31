import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/constants.dart';

class CardContent extends StatelessWidget {
  CardContent({@required this.label, @required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colorGrey,
          size: 80,
        ),
        SizedBox(height: 20),
        Text(
          label,
          style: styleLabel,
        )
      ],
    );
  }
}
