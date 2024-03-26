/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/*
* @author MisTrale
* @params displayErrorMessage: SHOULD BE NOT STATIC
*/
class CustomButton extends StatelessWidget {
  final bool isDark;
  final TextEditingController controller;
  final bool displayErrorMessage;
  final String errorMessage;
  final double borderRadius;
  final String labelText;
  final String hintText;
  final void Function(String)? onChanged;

  const CustomButton({
    Key? key,
    required this.isDark,
    required this.controller,
    required this.displayErrorMessage,
    required this.errorMessage,
    required this.borderRadius,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: false,
        decoration: InputDecoration(
          errorText: displayErrorMessage ? null : errorMessage,
          errorStyle: const TextStyle(
            color: Colors.red,
            height: 0.3,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          filled: true,
          fillColor: isDark ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.1),
          border: const OutlineInputBorder(),
          labelText: labelText,
          labelStyle: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
