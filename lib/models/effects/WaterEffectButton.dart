import 'dart:async';
import 'package:flutter/material.dart';

class WaterEffectButton extends StatefulWidget {

  const WaterEffectButton({
    Key? key
  }) : super(key: key);

  @override
  State<WaterEffectButton> createState() => _WaterEffectButtonState();
}

class _WaterEffectButtonState extends State<WaterEffectButton>
    with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
        }
      });

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => controller.forward());
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Animated ring
              Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color.fromARGB(255, 14, 101, 93).withOpacity(1 - controller.value),
                      width: 1,
                    ),
                  ),
                ),
              ),
              // Center check icon
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 14, 101, 93),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
