/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final String text;
  final Color color;
  final Color? startColor;
  final Color? endColor;

  const SimpleCard({
    Key? key,
    required this.text,
    required this.color,
    this.startColor,
    this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}