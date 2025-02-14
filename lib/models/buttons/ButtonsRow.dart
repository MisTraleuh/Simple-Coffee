import 'package:flutter/material.dart';

class ButtonsRow extends StatefulWidget {
  final List<String> buttonNames;
  final Color activeColor;
  final Color inactiveColor;
  final double borderRadius;
  final Function(String) onButtonPressed;
  final TextStyle? isActiveTextStyle;
  final TextStyle? isInactiveTextStyle;
  final Size buttonSize;

  const ButtonsRow({
    Key? key,
    required this.buttonNames,
    required this.activeColor,
    required this.inactiveColor,
    required this.borderRadius,
    required this.onButtonPressed,
    this.isActiveTextStyle,
    this.isInactiveTextStyle,
    required this.buttonSize,
  }) : super(key: key);

  @override
  State<ButtonsRow> createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  String? activeButton;

  @override
  Widget build(BuildContext context) {

    activeButton ??= widget.buttonNames.first;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.buttonNames.map((name) {
          bool isActive = activeButton == name;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  activeButton = name;
                });
                widget.onButtonPressed(name);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? widget.activeColor : widget.inactiveColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                shadowColor: Colors.grey,
                minimumSize: widget.buttonSize,
              ),
              child: Text(
                name,
                style: isActive ? widget.isActiveTextStyle : widget.isInactiveTextStyle,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}