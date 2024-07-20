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
            padding: EdgeInsets.only(top: height * 0.25),
            child: const Center(
              child: Text(
                "Coffee so good,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.34),
            child: const Center(
              child: Text(
                "your taste buds",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.45),
            child: const Center(
              child: Text(
                "will love it.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.56),
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
            padding: EdgeInsets.only(top: height * 0.6),
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
            padding: EdgeInsets.only(top: height * 0.8),
            child: GestureDetector(
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.08,
                  child: SimpleCard(
                    text: "Get Started",
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
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
