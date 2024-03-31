/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class SimpleTextButton extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Color color;
  final void Function(String)? onChanged;

  const SimpleTextButton({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SimpleTextButton> createState() => _SimpleTextButtonState();
}

class _SimpleTextButtonState extends State<SimpleTextButton> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  double height = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

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
        SizedBox( height: height / 100 ),
        TextField(
          focusNode: _focusNode,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
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
            hintText: _isFocused ? null : widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          cursorColor: Colors.white,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
} 