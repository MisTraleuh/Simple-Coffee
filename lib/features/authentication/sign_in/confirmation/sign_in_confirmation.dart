import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/authentication/sign_in/confirmation/sign_in_confirmation_page_desktop.dart';
import 'package:simple_coffee/features/authentication/sign_in/confirmation/sign_in_confirmation_page_tablet.dart';
import 'package:simple_coffee/features/authentication/sign_in/confirmation/sign_in_confirmation_page_mobile.dart';

class SignInConfirmation extends StatefulWidget {

  final ScreenType screenType;

  const SignInConfirmation({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<SignInConfirmation> createState() => _SignInConfirmationState();
}

class _SignInConfirmationState extends State<SignInConfirmation> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const SignInConfirmationDesktop();
      case ScreenType.tablet:
        return const SignInConfirmationTablet();
      case ScreenType.mobile:
        return const SignInConfirmationMobile();
    }
  }
}