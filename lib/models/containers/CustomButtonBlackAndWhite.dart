import 'package:flutter/material.dart';

/*
* @author MisTrale
*/

class CustomButtonBlackAndWhite extends StatelessWidget {
  final double borderRadius;
  final String text;
  final void Function()? onPressed;
  final BuildContext? context;

  const CustomButtonBlackAndWhite({
    Key? key,
    required this.borderRadius,
    required this.text,
    this.onPressed,
    this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}