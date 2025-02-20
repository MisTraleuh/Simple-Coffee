import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/sign_in/step2/sign_in_step2_page_desktop.dart';
import 'package:simple_coffee/features/authentication/sign_in/step2/sign_in_step2_page_tablet.dart';
import 'package:simple_coffee/features/authentication/sign_in/step2/sign_in_step2_page_mobile.dart';

class SignInStep2 extends StatefulWidget {
  final ScreenType screenType;

  const SignInStep2({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<SignInStep2> createState() => _SignInStep2State();
}

class _SignInStep2State extends State<SignInStep2> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const SignInStep2Desktop();
      case ScreenType.tablet:
        return const SignInStep2Tablet();
      case ScreenType.mobile:
        return const SignInStep2Mobile();
    }
  }
}
