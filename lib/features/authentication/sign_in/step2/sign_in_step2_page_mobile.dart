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
import 'package:simple_coffee/shared/providers/profile_information_cache.dart';

class SignInStep2Mobile extends StatefulWidget {

  const SignInStep2Mobile({
    Key? key
  }) : super(key: key);

  @override
  State<SignInStep2Mobile> createState() => _SignInStep2MobileState();
}

class _SignInStep2MobileState extends State<SignInStep2Mobile> {

  static const int minimum = 4800;
  static const int maximum = 5500;

  static final _durations = [
      minimum + Random().nextInt(maximum - minimum).toInt(),
  ];

  static const _heightPercentages = [
      0.65,
  ];

  // FIRST BUTTON
  static bool hasErrorFirstButton = false;
  static bool isPassedFirstButton = false;

  // SECOND BUTTON
  static bool hasErrorSecondButton = false;
  static bool isPassedSecondButton = false;

  static bool isIdentical = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final profileInformation = Provider.of<ProfileInformationCache>(context, listen: true);
    profileInformation.loadUser();

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
                  imagePath: "assets/app/OnBoarding/SignIn/SigninStep2.png",
                ),
              ),
              Text("This is here: ${profileInformation.userPreferences.toString()}", style: const TextStyle(color: Colors.white)),
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
                value: 0.66,
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 150, 93, 57)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox( height: height * 0.04 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: SimpleTextButton(
              labelText: "Password",
              hintText: "Enter your password",
              obscureText: true,
              color: Theme.of(context).colorScheme.primary,
              onChanged: (String value) {
                profileInformation.updatePassword(value, true);
                setState(() {
                  if (isPassedFirstButton == false) isPassedFirstButton = true;
                  hasErrorFirstButton = profileInformation.userPreferences.password.length < 8;
                });
                hasErrorFirstButton = hasErrorFirstButton;
              },
              hasError: hasErrorFirstButton,
              errorText: "Password must be at least 8 characters",
              fontSize: 16,
            ),
          ),
          SizedBox( height: height * 0.02 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: SimpleTextButton(
              labelText: "Confirm Password",
              hintText: "Confirm your password",
              obscureText: true,
              color: Theme.of(context).colorScheme.primary,
              onChanged: (String value) {
                profileInformation.updateConfirmPassword(value, true);
                setState(() {
                  if (isPassedSecondButton == false) isPassedSecondButton = true;
                  isIdentical = profileInformation.isPasswordIdentical();
                  hasErrorSecondButton = !isIdentical;
                });
              },
              errorText: "Passwords do not match",
              hasError: hasErrorSecondButton,
            ),
          ),
          SizedBox( height: height * 0.04 ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: ButtonPressableIfCondition(
              onTap: () {
                Navigator.pushNamed(context, '/signin-s3');
              },
              condition: () {
                return isPassedFirstButton && isPassedSecondButton &&
                       !hasErrorFirstButton && !hasErrorSecondButton && isIdentical;
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
