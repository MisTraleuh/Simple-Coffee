import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/register_pages/register_page_desktop.dart';
import 'package:simple_coffee/features/authentication/register_pages/register_page_tablet.dart';
import 'package:simple_coffee/features/authentication/register_pages/register_page_mobile.dart';
import 'package:simple_coffee/features/authentication/register_pages/register_page_watch.dart';

class RegisterPage extends StatefulWidget {

  final ScreenType screenType;

  const RegisterPage({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const RegisterPageDesktop();
      case ScreenType.tablet:
        return const RegisterPageTablet();
      case ScreenType.mobile:
        return const RegisterPageMobile();
      case ScreenType.watch:
        return const RegisterPageWatch();
      default:
        return const RegisterPageMobile();
    }
  }

}