/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_coffee/commons/SimpleButton.dart';
import 'package:simple_coffee/commons/CommonTopImage.dart';
import 'package:simple_coffee/commons/SimpleTextButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold( 
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height / 2.9,
            width: width,
            child: const CommonTopImage(
              imagePath: "assets/app/LoginPage.png",
            ),
          ),
          SizedBox( height: height / 30.6 ),
          const Center(
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox( height: height / 30.6 ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, right: width / 12),
            child: SimpleTextButton(
              labelText: "Email / Phone number",
              hintText: "Enter your email or phone number",
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

}
