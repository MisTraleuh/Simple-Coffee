import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String rating;
  final String nameType;
  final String description;
  final String price;
  final Color buttonColor;
  final BoxConstraints parentConstraints;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.rating,
    required this.nameType,
    required this.description,
    required this.price,
    required this.buttonColor,
    required this.parentConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: parentConstraints.maxHeight * 0.5,
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      nameType,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                      child: AutoSizeText(
                      description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      minFontSize: 5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            '\$ $price',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            maxLines: 1,
                            minFontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: parentConstraints.maxWidth * 0.3,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Buy',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
