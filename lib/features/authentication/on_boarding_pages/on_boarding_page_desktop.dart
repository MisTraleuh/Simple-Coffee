import 'package:flutter/material.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_info.dart';

class OnBoardingPageDesktop extends StatefulWidget {

  const OnBoardingPageDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingPageDesktop> createState() => _OnBoardingPageDesktopState();
}

class _OnBoardingPageDesktopState extends State<OnBoardingPageDesktop> {
  @override
  Widget build(BuildContext context) {
    ScreenInfo screenInfo = ScreenInfo();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/app/OnBoarding/OnBoardingPage.png",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'OnBoarding Page for Desktop',
            style: TextStyle(color: Colors.white)
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 4),
            child: Center(
              child: Text(
                "Coffee so good, your taste buds will love it.",
                style: screenInfo.getTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.9),
            child: Center(
              child: Text(
                "The best grain, the finest roast, the powerful flavor",
                style: screenInfo.getTextStyle(context).copyWith(
                  color: const Color.fromARGB(255, 169, 169, 169),
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.3),
            child: GestureDetector(
              child: Center(
                child: SizedBox(
                  width: width / 1.2,
                  height: height / 12,
                  child: SimpleCard(
                    text: "Get Started",
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: screenInfo.getTextStyle(context).copyWith(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ),
        ],
      ),
    );
  }
}
