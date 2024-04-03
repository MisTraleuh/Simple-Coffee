import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:simple_coffee/commons/SimpleButton.dart';
import 'package:simple_coffee/commons/CommonTopImage.dart';
import 'package:simple_coffee/commons/SimpleTextButton.dart';

/**************************
*    PROVIDERS IMPORTS    *
**************************/
import 'package:simple_coffee/state_management/providers/profile_information.dart';

class SignInStep3 extends StatefulWidget {

  const SignInStep3({
    Key? key
  }) : super(key: key);

  @override
  State<SignInStep3> createState() => _SignInStep3State();
}

class _SignInStep3State extends State<SignInStep3> {

  static const int minimum = 4800;
  static const int maximum = 5500;

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
    final profileInformation = Provider.of<ProfileInformation>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: height / 2.9,
                width: width,
                child: const CommonTopImage(
                  imagePath: "assets/app/OnBoarding/SignIn/SigninStep3.png",
                ),
              ),
              Positioned(
                top: height / 20.6,
                left: width / 12,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox( height: height / 50.6 ),
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
          SizedBox( height: height / 50.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: SizedBox(
              height: height / 90,
              child: LinearProgressIndicator(
                value: 1,
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 150, 93, 57)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox( height: height / 50.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: SimpleTextButton(
              labelText: "Your Name",
              hintText: "Enter your name",
              obscureText: false,
              color: Theme.of(context).colorScheme.primary,
              onChanged: (String value) {
                profileInformation.updateUsername(value);
              },
            ),
          ),
          SizedBox( height: height / 20.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/confirm-email');
              },
              child: SizedBox(
                height: height / 15.24,
                child: SimpleCard(
                  text: "Confirmation",
                  borderRadius: 16,
                  color: Theme.of(context).colorScheme.primary,
                  startColor: const Color.fromARGB(255, 198, 124, 78),
                  endColor: const Color.fromARGB(255, 96, 60, 38),
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
