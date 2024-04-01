/**************************
*     FLUTTER IMPORTS     *
**************************/
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
import 'package:simple_coffee/providers/ProfileInformations.dart';

class SignInStep1 extends StatefulWidget {

  const SignInStep1({
    Key? key
  }) : super(key: key);

  @override
  State<SignInStep1> createState() => _SignInStep1State();
}

class _SignInStep1State extends State<SignInStep1> {

  late ProfileInformations profileInformations;

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
    profileInformations = Provider.of<ProfileInformations>(context, listen: true);

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
                  imagePath: "assets/app/SigninStep1.png",
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
                value: 0.33,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox( height: height / 20.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: SimpleTextButton(
              labelText: "Email / Phone number",
              hintText: "Enter your email or phone number",
              obscureText: false,
              color: Theme.of(context).colorScheme.primary,
              onChanged: (String value) {
                profileInformations.setEmailInput(value);
              },
            ),
          ),
          SizedBox( height: height / 10.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signin-s2');
              },
              child: SizedBox(
                height: height / 15.24,
                child: SimpleCard(
                  text: "Next Step",
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