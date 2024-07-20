import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsivePage extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenType screenType) builder;

  const ResponsivePage({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenType screenType = getFormFactor(context);
        return builder(context, screenType);
      },
    );
  }
}

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double mobile = 400;
}

enum ScreenType { desktop, tablet, mobile, watch }

ScreenType getFormFactor(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).width;

  if (deviceWidth > FormFactor.desktop) return ScreenType.desktop;
  if (deviceWidth > FormFactor.tablet) return ScreenType.tablet;
  if (deviceWidth > FormFactor.mobile) return ScreenType.mobile;

  return ScreenType.watch;
}
