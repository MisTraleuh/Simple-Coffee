import 'package:flutter/material.dart';

class DetailsProductDesktop extends StatefulWidget {

  const DetailsProductDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsProductDesktop> createState() => _DetailsProductDesktopState();
}

class _DetailsProductDesktopState extends State<DetailsProductDesktop> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Details Product Page'),
      ),
    );
  }
}