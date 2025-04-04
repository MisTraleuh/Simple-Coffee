import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';
import 'package:simple_coffee/models/specials/CommonTopImage.dart';
import 'package:simple_coffee/models/buttons/MultiInputField.dart';

import 'package:simple_coffee/models/buttons/ButtonPressableIfCondition.dart';

/**************************
*    PROVIDERS IMPORTS    *
**************************/
import 'package:simple_coffee/shared/providers/profile_information_cache.dart';

class SignInConfirmationMobile extends StatefulWidget {

  const SignInConfirmationMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInConfirmationMobile> createState() => _SignInConfirmationMobileState();
}

class _SignInConfirmationMobileState extends State<SignInConfirmationMobile> {

  static const int minimum = 4800;
  static const int maximum = 5500;

  bool _isPassedFirstButton = false;
  bool _isPassedSecondButton = false;
  bool _isPassedThirdButton = false;
  bool _isPassedFourthButton = false;
  bool _isPassedFifthButton = false;
  bool _isPassedSixthButton = false;

  static final _durations = [
      minimum + Random().nextInt(maximum - minimum).toInt(),
  ];

  static const _heightPercentages = [
      0.65,
  ];

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
                  imagePath: "assets/app/OnBoarding/SignIn/SigninConfirmation.png",
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
              "Confirmation",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(
            child: Text(
              "A code will be send to your email or",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(
            child: Text(
              "phone number, enter this code right here",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox( height: height * 0.05 ),
          Center(
            child:
             Padding(
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: MultiInputField(
                numberOfFields: 6,
                fieldColor: Theme.of(context).colorScheme.primary,
                fieldWidth: width * 0.1,
                fieldHeight: height * 0.15,
                spaceBetweenFields: width * 0.01,
                onlyNumbers: true,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
                onChanged: (String value, int index) {
                  if (value.length > 1) {
                    value = value.substring(value.length - 1);
                  }
                  if (index == 0) {
                    if (_isPassedFirstButton == false) {
                      setState(() {
                        _isPassedFirstButton = true;
                      });
                    }
                  } else if (index == 1) {
                    if (_isPassedSecondButton == false) {
                      setState(() {
                        _isPassedSecondButton = true;
                      });
                    }
                  } else if (index == 2) {
                    if (_isPassedThirdButton == false) {
                      setState(() {
                        _isPassedThirdButton = true;
                      });
                    }
                  } else if (index == 3) {
                    if (_isPassedFourthButton == false) {
                      setState(() {
                        _isPassedFourthButton = true;
                      });
                    }
                  } else if (index == 4) {
                    if (_isPassedFifthButton == false) {
                      setState(() {
                        _isPassedFifthButton = true;
                      });
                    }
                  } else if (index == 5) {
                    if (_isPassedSixthButton == false) {
                      setState(() {
                        _isPassedSixthButton = true;
                      });
                    }
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: ButtonPressableIfCondition(
              onTap: () {
                profileInformation.updateIsAlreadyRegistered(true, true);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (Route<dynamic> route) => false,
                );
              },
              condition: () {
                return _isPassedFirstButton && _isPassedSecondButton && _isPassedThirdButton && _isPassedFourthButton && _isPassedFifthButton && _isPassedSixthButton;
              },
              childIfTrue: SizedBox(
                height: height * 0.08,
                child: SimpleCard(
                  text: "Finish",
                  borderRadius: 16,
                  color: Theme.of(context).colorScheme.primary,
                  startColor: const Color.fromARGB(255, 198, 124, 78),
                  endColor: const Color.fromARGB(255, 96, 60, 38),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
              childIfFalse: SizedBox(
                height: height * 0.08,
                child: SimpleCard(
                  text: "Finish",
                  borderRadius: 16,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  startColor: const Color.fromARGB(255, 198, 124, 78),
                  endColor: const Color.fromARGB(255, 96, 60, 38),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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