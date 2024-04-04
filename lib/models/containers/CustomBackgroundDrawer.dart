import 'package:flutter/material.dart';

class CustomBackgroundDrawer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? radiusColor;
  final double? borderRadius;
  final double radiusSize;
  final List<BoxShadow>? boxShadow;

  const CustomBackgroundDrawer({
    Key? key,
    required this.child,
    required this.backgroundColor,
     this.radiusColor,
    this.borderRadius = 20.0,
    this.radiusSize = 4.0,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        border: Border.all(
          color: radiusColor ?? Colors.transparent,
          width: radiusSize,
        ),
        boxShadow: boxShadow ?? [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        child: child,
      ),
    );
  }
}