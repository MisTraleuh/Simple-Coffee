/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**************************
*      PAGES IMPORTS      *
**************************/
import 'package:simple_coffee/pages/OnBoardingPage.dart';

void main() {
  runApp(
    const MyApp(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingPage(),
      },
    );
  }
}
