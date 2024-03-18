import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final String text;
  final Color circleColor;
  final Color textColor;

  const ColoredCircle({
    Key? key,
    required this.text,
    required this.circleColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.5,
      ),
    );
  }
}
