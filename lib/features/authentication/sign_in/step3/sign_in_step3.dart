import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/sign_in/step3/sign_in_step3_page_desktop.dart';
import 'package:simple_coffee/features/authentication/sign_in/step3/sign_in_step3_page_tablet.dart';
import 'package:simple_coffee/features/authentication/sign_in/step3/sign_in_step3_page_mobile.dart';

class SignInStep3 extends StatefulWidget {

  final ScreenType screenType;

  const SignInStep3({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<SignInStep3> createState() => _SignInStep3State();
}

class _SignInStep3State extends State<SignInStep3> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const SignInStep3Desktop();
      case ScreenType.tablet:
        return const SignInStep3Tablet();
      case ScreenType.mobile:
        return const SignInStep3Mobile();
    }
  }
}
