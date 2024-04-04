import 'package:flutter/material.dart';

@immutable
class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final Function(String) onTextChanged;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  widget.icon,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                  onChanged: (value) {
                    widget.onTextChanged(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
