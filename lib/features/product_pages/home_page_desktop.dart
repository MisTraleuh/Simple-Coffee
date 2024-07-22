import 'package:flutter/material.dart';

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