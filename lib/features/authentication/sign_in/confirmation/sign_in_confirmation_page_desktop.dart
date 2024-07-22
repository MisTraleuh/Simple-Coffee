import 'package:flutter/material.dart';

class SignInConfirmationDesktop extends StatefulWidget {

  const SignInConfirmationDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInConfirmationDesktop> createState() => _SignInConfirmationDesktopState();
}

class _SignInConfirmationDesktopState extends State<SignInConfirmationDesktop> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Desktop'),
    );
  }
}