import 'package:flutter/material.dart';

class DetailsProductDesktop extends StatefulWidget {

  final Map<String, dynamic> product;

  const DetailsProductDesktop({
    Key? key,
    required this.product,
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