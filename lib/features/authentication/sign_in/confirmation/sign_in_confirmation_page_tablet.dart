import 'package:flutter/material.dart';

class SignInConfirmationTablet extends StatefulWidget {

  const SignInConfirmationTablet({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInConfirmationTablet> createState() => _SignInConfirmationTabletState();
}

class _SignInConfirmationTabletState extends State<SignInConfirmationTablet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Desktop'),
    );
  }
}
