import 'package:flutter/material.dart';

class SimpleTextButton extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Color color;
  final void Function(String)? onChanged;
  final bool? hasError;
  final bool obscureText;
  final double? fontSize;

  const SimpleTextButton({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.color,
    required this.onChanged,
    required this.obscureText,
    this.fontSize,
    this.hasError,
  }) : super(key: key);

  @override
  State<SimpleTextButton> createState() => _SimpleTextButtonState();
}

class _SimpleTextButtonState extends State<SimpleTextButton> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isObscured = false;
  double height = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _isObscured = widget.obscureText;
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
          style: TextStyle(
            color: Colors.black,
            fontSize: widget.fontSize ?? 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox( height: height / 100 ),
        TextField(
          focusNode: _focusNode,
          style: const TextStyle(
            color: Colors.white,
          ),
          obscureText: _isObscured,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            suffixIcon: (widget.obscureText == true ? IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ) : null),
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
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: widget.color,
            border: const OutlineInputBorder(),
            hintText: _isFocused ? null : widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
            errorText: widget.hasError == true ? "Invalid email" : null,
          ),
          cursorColor: Colors.white,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
} 