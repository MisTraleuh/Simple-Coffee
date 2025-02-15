import 'package:flutter/material.dart';

class DetailsProductMobile extends StatefulWidget {

  final Map<String, String> product;

  const DetailsProductMobile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsProductMobile> createState() => _DetailsProductMobileState();
}

class _DetailsProductMobileState extends State<DetailsProductMobile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.product['nameType']!),
            const SizedBox(width: 10),
            Text(widget.product['withAdding']!),
          ],
        ),
      ),
      body: Center(
        child: Text('Details Product Page'),
      ),
    );
  }
}