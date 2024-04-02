import 'package:flutter/material.dart';

class IconTextCard extends StatelessWidget {
  final String iconUrl;
  final String name;
  final bool isDark;

  const IconTextCard({
    Key? key,
    required this.iconUrl,
    required this.name,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white : Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          Image.network(
            iconUrl,
            width: 40,
            height: 40,
            color: isDark ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 15),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
