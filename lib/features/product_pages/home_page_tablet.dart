import 'package:flutter/material.dart';

class HomeTablet extends StatefulWidget {

  const HomeTablet({
    Key? key
  }) : super(key: key);

  @override
  State<HomeTablet> createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home Page"),
    );
  }
}