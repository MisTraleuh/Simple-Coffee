import 'package:flutter/material.dart';

class DetailsProductTablet extends StatefulWidget {

  final Map<String, String> product;

  const DetailsProductTablet({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsProductTablet> createState() => _DetailsProductTabletState();
}

class _DetailsProductTabletState extends State<DetailsProductTablet> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Details Product Page'),
      ),
    );
  }
}