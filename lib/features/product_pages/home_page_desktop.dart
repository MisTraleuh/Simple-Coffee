import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:simple_coffee/models/buttons/SimpleButton.dart';
import 'package:simple_coffee/models/specials/CommonTopImage.dart';
import 'package:simple_coffee/models/buttons/SimpleTextButton.dart';

/**************************
*    PROVIDERS IMPORTS    *
**************************/
import 'package:simple_coffee/shared/providers/profile_information.dart';

class HomeDesktop extends StatefulWidget {

  const HomeDesktop({
    Key? key
  }) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home Page"),
    );
  }
}