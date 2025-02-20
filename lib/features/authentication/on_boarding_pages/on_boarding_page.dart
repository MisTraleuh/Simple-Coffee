import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/on_boarding_pages/on_boarding_page_desktop.dart';
import 'package:simple_coffee/features/authentication/on_boarding_pages/on_boarding_page_tablet.dart';
import 'package:simple_coffee/features/authentication/on_boarding_pages/on_boarding_page_mobile.dart';

class OnBoardingPage extends StatefulWidget {
  final ScreenType screenType;

  const OnBoardingPage({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const OnBoardingPageDesktop();
      case ScreenType.tablet:
        return const OnBoardingPageTablet();
      case ScreenType.mobile:
        return const OnBoardingPageMobile();
    }
  }
}
