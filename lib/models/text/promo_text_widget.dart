import 'package:flutter/material.dart';

class PromoTextWidget extends StatelessWidget {
  final String text;
  final double textSize;

  const PromoTextWidget({
    super.key,
    required this.text,
    this.textSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: text.split("\n").asMap().entries.map((entry) {
            int index = entry.key;
            String line = entry.value;

            return Positioned(
              top: index * 30.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                color: Colors.black,
                child: Text(
                  line,
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
