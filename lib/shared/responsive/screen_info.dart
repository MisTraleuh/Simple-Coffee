
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_coffee/shared/responsive/screen_type.dart';

class ScreenInfo {

  TextStyle getTextStyle(BuildContext context) {
    ScreenType screenType = getFormFactor(context);

    switch(screenType) {
      case ScreenType.desktop:
        return const TextStyle(
          color: Colors.white,
          fontSize: 62,
          fontWeight: FontWeight.bold,
        );
      case ScreenType.tablet:
        return const TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold
        );
      case ScreenType.mobile:
        return const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold
        );
      default: return const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      );
    }
  }
}
