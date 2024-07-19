// FLUTTER IMPORTS
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// PAGES IMPORTS
import 'package:simple_coffee/features/authentication/on_boarding_pages/on_boarding_page.dart';
import 'package:simple_coffee/features/authentication/register.dart';
import 'package:simple_coffee/features/authentication/login_in/login_page.dart';
import 'package:simple_coffee/features/authentication/sign_in/sign_in_step1.dart';
import 'package:simple_coffee/features/authentication/sign_in/sign_in_step2.dart';
import 'package:simple_coffee/features/authentication/sign_in/sign_in_step3.dart';

// PROVIDERS IMPORTS
import 'package:simple_coffee/shared/providers/profile_information.dart';

// RESPONSIVE IMPORTS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// Material Design
const Color primaryColor = Color.fromARGB(255, 198, 124, 78);
const Color secondaryColor = Color.fromARGB(255, 96, 60, 38);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileInformation()),
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
  State<MyApp> createState() {
    return _MyAppState();
  }
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
        '/': (context) => ResponsivePage(
              builder: (context, screenType) {
                return OnBoardingPage(screenType: screenType);
              },
            ),
            /*
        '/register': (context) => ResponsivePage(
              builder: (context, screenType) {
                return RegisterPage(screenType: screenType);
              },
            ),
        '/login': (context) => ResponsivePage(
              builder: (context, screenType) {
                return LoginPage(screenType: screenType);
              },
            ),
        '/signin-s1': (context) => ResponsivePage(
              builder: (context, screenType) {
                return SignInStep1(screenType: screenType);
              },
            ),
        '/signin-s2': (context) => ResponsivePage(
              builder: (context, screenType) {
                return SignInStep2(screenType: screenType);
              },
            ),
        '/signin-s3': (context) => ResponsivePage(
              builder: (context, screenType) {
                return SignInStep3(screenType: screenType);
              },
            ),
            */
      },
    );
  }
}
