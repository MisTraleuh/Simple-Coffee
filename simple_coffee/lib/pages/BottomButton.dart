/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  final VoidCallback onPanik;

  BottomButton({
    Key? key,
    required this.onPanik,
  }) : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPanik,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Icon(
              Icons.help_outline,
              color: Color.fromARGB(255, 14 , 101 , 93),
              size: 25,
            ),
            Text(
              "Besoin d'aide ?",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
        ],
      ),
    );
  }
}
