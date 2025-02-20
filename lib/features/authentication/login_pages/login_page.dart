import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/login_pages/login_page_desktop.dart';
import 'package:simple_coffee/features/authentication/login_pages/login_page_tablet.dart';
import 'package:simple_coffee/features/authentication/login_pages/login_page_mobile.dart';

class LoginPage extends StatefulWidget {
  final ScreenType screenType;

  const LoginPage({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const LoginPageDesktop();
      case ScreenType.tablet:
        return const LoginPageTablet();
      case ScreenType.mobile:
        return const LoginPageMobile();
    }
  }
}
