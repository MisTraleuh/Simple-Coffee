import 'package:flutter/material.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';

class RegisterPageWatch extends StatefulWidget {

  const RegisterPageWatch({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPageWatch> createState() => _RegisterPageWatchState();
}

class _RegisterPageWatchState extends State<RegisterPageWatch> {

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
            padding: EdgeInsets.only(top: height / 3),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: SimpleCard(
                    text: "Login",
                    color: Theme.of(context).colorScheme.primary,
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
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: SimpleCard(
                    text: "Sign Up",
                    color: Theme.of(context).colorScheme.primary,
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