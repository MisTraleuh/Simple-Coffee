import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/product_pages/home_pages/home_page_desktop.dart';
import 'package:simple_coffee/features/product_pages/home_pages/home_page_tablet.dart';
import 'package:simple_coffee/features/product_pages/home_pages/home_page_mobile.dart';

class Home extends StatefulWidget {

  final ScreenType screenType;

  const Home({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const HomeDesktop();
      case ScreenType.tablet:
        return const HomeTablet();
      case ScreenType.mobile:
        return const HomeMobile();
      default:
        return const HomeMobile();
    }
  }
}