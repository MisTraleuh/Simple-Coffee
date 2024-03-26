/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData getThemeData(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark ? const Color(0xFF303030) : Colors.white,
    );
  }
}
