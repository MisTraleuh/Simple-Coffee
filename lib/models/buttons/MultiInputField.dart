import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiInputField extends StatefulWidget {
  final int numberOfFields;
  final Color fieldColor;
  final double fieldHeight;
  final double fieldWidth;
  final Function(String, int) onChanged;
  final double spaceBetweenFields;
  final bool onlyNumbers;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const MultiInputField({
    Key? key,
    required this.numberOfFields,
    required this.fieldColor,
    required this.fieldHeight,
    required this.fieldWidth,
    required this.onChanged,
    required this.spaceBetweenFields,
    this.onlyNumbers = false,
    this.inputFormatters,
    this.maxLength,
  }) : super(key: key);

  @override
  _MultiInputFieldState createState() => _MultiInputFieldState();
}

class _MultiInputFieldState extends State<MultiInputField> {
late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode>.generate(widget.numberOfFields, (int index) => FocusNode());
    if (widget.onlyNumbers && widget.inputFormatters == null) {
      widget.inputFormatters!.add(FilteringTextInputFormatter.digitsOnly);
      }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleInputChange(String value, int index) {
    if (value.isNotEmpty) {
      if (index < _focusNodes.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfFields, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.spaceBetweenFields),
          child: Container(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            child: TextField(
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: widget.onlyNumbers ? TextInputType.number : TextInputType.text,
              inputFormatters: widget.inputFormatters ?? [],
              maxLength: widget.maxLength,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: widget.fieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                widget.onChanged(value, index);
                _handleInputChange(value, index);
              }
            ),
          ),
        );
      }),
    );
  }
}