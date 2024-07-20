import 'package:flutter/material.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_info.dart';

class OnBoardingPageTablet extends StatefulWidget {

  const OnBoardingPageTablet({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingPageTablet> createState() => _OnBoardingPageTabletState();
}

class _OnBoardingPageTabletState extends State<OnBoardingPageTablet> {
  @override
  Widget build(BuildContext context) {
    ScreenInfo screenInfo = ScreenInfo();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/app/OnBoarding/OnBoardingPage.png",
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Text('OnBoarding Page for TABLET', style: TextStyle(color: Colors.white)),
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
            padding: EdgeInsets.only(top: height / 2),
            child: Center(
              child: Text(
                "The best grain, the finest roast, the",
                style: screenInfo.getTextStyle(context).copyWith(
                  color:const Color.fromARGB(255, 169, 169, 169),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.75),
            child: Center(
              child: Text(
                "powerful flavor",
                style: screenInfo.getTextStyle(context).copyWith(
                  color: const Color.fromARGB(255, 169, 169, 169),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.25),
            child: GestureDetector(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: SimpleCard(
                    textStyle: screenInfo.getTextStyle(context).copyWith(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600
                    ),
                    text: "Get Started",
                    color: Theme.of(context).colorScheme.primary,
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
