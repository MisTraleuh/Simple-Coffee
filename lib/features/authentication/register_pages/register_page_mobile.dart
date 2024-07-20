import 'package:flutter/material.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';

class RegisterPageMobile extends StatefulWidget {

  const RegisterPageMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPageMobile> createState() => _RegisterPageMobileState();
}

class _RegisterPageMobileState extends State<RegisterPageMobile> {

 @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/app/OnBoarding/RegisterPage.png",
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.4),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.08,
                  child: SimpleCard(
                    text: "Login",
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.6),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signin-s1');
              },
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.08,
                  child: SimpleCard(
                    text: "Sign Up",
                    color: Theme.of(context).colorScheme.primary,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}