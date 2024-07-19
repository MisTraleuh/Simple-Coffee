import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final String text;
  final Color color;
  final Color? startColor;
  final Color? endColor;
  final double? borderRadius;
  final TextStyle? textStyle;

  const SimpleCard({
    Key? key,
    required this.text,
    required this.color,
    this.startColor,
    this.endColor,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border: Border.all(
          width: 2,
          color: color,
        ),
        gradient: LinearGradient(
          colors: [startColor ?? color, endColor ?? color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
