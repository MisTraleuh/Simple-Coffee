import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';
import 'package:simple_coffee/models/specials/CommonTopImage.dart';
import 'package:simple_coffee/models/buttons/SimpleTextButton.dart';

import 'package:simple_coffee/models/buttons/ButtonPressableIfCondition.dart';

/**************************
*    PROVIDERS IMPORTS    *
**************************/
import 'package:simple_coffee/shared/providers/profile_information.dart';

class SignInStep1Mobile extends StatefulWidget {

  const SignInStep1Mobile({
    Key? key
  }) : super(key: key);

  @override
  State<SignInStep1Mobile> createState() => _SignInStep1MobileState();
}

class _SignInStep1MobileState extends State<SignInStep1Mobile> {

  static const int minimum = 4800;
  static const int maximum = 5500;

  static final _durations = [
      minimum + Random().nextInt(maximum - minimum).toInt(),
  ];

  static const _heightPercentages = [
      0.65,
  ];

  static bool hasError = false;
  static bool isPassed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final profileInformation = Provider.of<ProfileInformation>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: height * 0.35,
                width: width,
                child: const CommonTopImage(
                  imagePath: "assets/app/OnBoarding/SignIn/SigninStep1.png",
                ),
              ),
              Positioned(
                top: height * 0.05,
                left: width * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox( height: height * 0.02 ),
          const Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox( height: height * 0.02 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: SizedBox(
              height: height * 0.01,
              child: LinearProgressIndicator(
                value: 0.33,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox( height: height * 0.04 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: SimpleTextButton(
              labelText: "Email / Phone number",
              hintText: "Enter your email or phone number",
              obscureText: false,
              color: Theme.of(context).colorScheme.primary,
              onChanged: (String value) {
                profileInformation.updateEmail(value);
                setState(() {
                  if (isPassed == false) isPassed = true;
                  // REGEX AND CHECK IF EMAIL IS VALID ON PROFILE INFORMATION
                  hasError = (profileInformation.profile.email.isEmpty) ? true : false;
                });
              },
              fontSize: 16,
              hasError: hasError,
            ),
          ),
          SizedBox( height: height * 0.1 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: ButtonPressableIfCondition(
              onTap: () {
                Navigator.pushNamed(context, '/signin-s2');
              },
              condition: () {
                return isPassed && !hasError;
              },
              childIfTrue: SizedBox(
                height: height * 0.08,
                child: SimpleCard(
                  text: "Next Step",
                  borderRadius: 16,
                  color: Theme.of(context).colorScheme.primary,
                  startColor: const Color.fromARGB(255, 198, 124, 78),
                  endColor: const Color.fromARGB(255, 96, 60, 38),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              childIfFalse: SizedBox(
                height: height * 0.08,
                child: SimpleCard(
                  text: "Next Step",
                  borderRadius: 16,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  startColor: const Color.fromARGB(255, 198, 124, 78),
                  endColor: const Color.fromARGB(255, 96, 60, 38),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: WaveWidget(
              config: CustomConfig(
                colors: [Theme.of(context).colorScheme.primary],
                durations: _durations,
                heightPercentages: _heightPercentages,
              ),
              backgroundColor: Colors.transparent,
              size: const Size(double.infinity, 15.0),
              waveAmplitude: 13,
            ),
          ),
        ],
      ),
    );
  }

}