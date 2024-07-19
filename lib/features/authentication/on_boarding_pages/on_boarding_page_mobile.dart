import 'package:flutter/material.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';

class OnBoardingPageMobile extends StatefulWidget {

  const OnBoardingPageMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoardingPageMobile> createState() => _OnBoardingPageMobileState();
}

class _OnBoardingPageMobileState extends State<OnBoardingPageMobile> {
  @override
  Widget build(BuildContext context) {
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
          Text('OnBoarding Page for MOBILE', style: TextStyle(color: Colors.white)),
          Padding(
            padding: EdgeInsets.only(top: height / 4),
            child: const Center(
              child: Text(
                "Coffee so good,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 2.9),
            child: const Center(
              child: Text(
                "your taste buds",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 2.3),
            child: const Center(
              child: Text(
                "will love it.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.8),
            child: const Center(
              child: Text(
                "The best grain, the finest roast, the",
                style: TextStyle(
                  color: Color.fromARGB(255, 169, 169, 169),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.65),
            child: const Center(
              child: Text(
                "powerful flavor",
                style: TextStyle(
                  color: Color.fromARGB(255, 169, 169, 169),
                  fontSize: 16,
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
