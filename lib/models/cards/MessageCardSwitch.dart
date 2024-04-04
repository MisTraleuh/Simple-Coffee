import 'package:flutter/material.dart';

class MessageCardWithSwitch extends StatefulWidget {
  final String message;
  final IconData icon1;
  final IconData icon2;
  final bool isDark;

  const MessageCardWithSwitch({
    Key? key,
    required this.message,
    required this.icon1,
    required this.icon2,
    required this.isDark,
  }) : super(key: key);

  @override
  State<MessageCardWithSwitch> createState() => _MessageCardWithSwitchState();
}

class _MessageCardWithSwitchState extends State<MessageCardWithSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: ThemeData(
          useMaterial3: true,
        ).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(outline: widget.isDark? Colors.white : Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(widget.icon1, color: widget.isDark ? Colors.white : Colors.black, size: 30),
            Expanded(
              child: Text(
                widget.message,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(widget.icon2, color: widget.isDark ? Colors.white : Colors.black, size: 30),
            const SizedBox(width: 8),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: widget.isDark ? Colors.white : Colors.black,
              inactiveTrackColor: const Color(0xFFE89999),
            ),
          ],
        ),
      ),
    );
  }
}
