/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {

  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 75.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: screenWidth * 0.05),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Expanded(
            child: Text(
              'Votre réservation',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.15),
        ],
      ),
    );
  }
}