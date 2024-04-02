import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final IconData icon1;
  final IconData icon2;
  final bool isDark;

  const MessageCard({Key? key, required this.message, required this.icon1, required this.icon2, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon1, color: isDark ? Colors.black : Colors.white, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.black : Colors.white,
              )
            )
          ),
          Icon(icon2, color: isDark ? Colors.black :Colors.white, size: 30),
        ],
      ),
    );
  }
}

