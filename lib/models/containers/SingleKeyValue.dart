import 'package:flutter/material.dart';

class SingleKeyValue extends StatelessWidget {
  final String title;

  const SingleKeyValue({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Text(
          "Ce commerçant prévoit tout ce qu'il faut",
          style: TextStyle(
            fontSize: 15,
          ),
          overflow: TextOverflow.visible,
        ),
        const Text(
          "pour récupérer et ramener votre panier chez",
          style: TextStyle(
            fontSize: 15,
          ),
          overflow: TextOverflow.visible,
        ),
        const Text(
          "vous.",
          style: TextStyle(
            fontSize: 15,
          ),
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
