/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class SimpleTextButton extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Color color;

  const SimpleTextButton({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.color,
  }) : super(key: key);

  @override
  State<SimpleTextButton> createState() => _SimpleTextButtonState();
}

class _SimpleTextButtonState extends State<SimpleTextButton> {


  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.labelText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox( height: heigth / 100 ),
        TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            filled: true,
            fillColor: widget.color,
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          cursorColor: Colors.white,
          onChanged: (value) {
            print(value);
          },
        ),
      ],
    );
  }
} 