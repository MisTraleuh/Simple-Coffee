import 'package:flutter/material.dart';

class DetailsProductMobile extends StatefulWidget {

  const DetailsProductMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsProductMobile> createState() => _DetailsProductMobileState();
}

class _DetailsProductMobileState extends State<DetailsProductMobile> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Details Product Page'),
      ),
    );
  }
}