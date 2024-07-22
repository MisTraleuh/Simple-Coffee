import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/sign_in/step1/sign_in_step1_page_desktop.dart';
import 'package:simple_coffee/features/authentication/sign_in/step1/sign_in_step1_page_tablet.dart';
import 'package:simple_coffee/features/authentication/sign_in/step1/sign_in_step1_page_mobile.dart';

class SignInStep1 extends StatefulWidget {

  final ScreenType screenType;

  const SignInStep1({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<SignInStep1> createState() => _SignInStep1State();
}

class _SignInStep1State extends State<SignInStep1> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const SignInStep1Desktop();
      case ScreenType.tablet:
        return const SignInStep1Tablet();
      case ScreenType.mobile:
        return const SignInStep1Mobile();
      default:
        return const SignInStep1Mobile();
    }
  }
}