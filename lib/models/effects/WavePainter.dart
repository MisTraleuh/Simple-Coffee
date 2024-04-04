import 'package:flutter/material.dart';
import 'dart:math';

class WavePainter extends CustomPainter {
  final Animation<double> animation;

  WavePainter({
    required this.animation
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    var path = Path();

    double waveHeight = 20;
    double animationValue = animation.value * 2 * 3.14;

    path.moveTo(0, size.height);
    for (double i = 0; i < size.width; i++) {
      path.lineTo(i, size.height - sin((i / size.width * 2 * 3.14) + animationValue) * waveHeight);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
