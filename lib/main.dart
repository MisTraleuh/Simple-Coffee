/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/**************************
*      PAGES IMPORTS      *
**************************/
import 'package:simple_coffee/pages/OnBoardingPage.dart';
import 'package:simple_coffee/pages/Register.dart';
import 'package:simple_coffee/pages/LoginPage.dart';
import 'package:simple_coffee/pages/SignIn/SigninStep1.dart';
import 'package:simple_coffee/pages/SignIn/SigninStep2.dart';
import 'package:simple_coffee/pages/SignIn/SigninStep3.dart';

/**************************
*    PROVIDERS IMPORTS    *
**************************/
import 'package:simple_coffee/providers/ProfileInformations.dart';

/**************************
*     FLUTTER IMPORTS     *
*    (Material Design)    *
**************************/
const Color primaryColor = Color.fromARGB(255, 198, 124, 78);
const Color secondaryColor = Color.fromARGB(255, 96, 60, 38);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileInformations()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/register' : (context) => const RegisterPage(),
        '/login' : (context) => const LoginPage(),
        '/signin-s1' : (context) => const SignInStep1(),
        '/signin-s2' : (context) => const SignInStep2(),
        '/signin-s3' : (context) => const SignInStep3(),
      },
    );
  }
}
