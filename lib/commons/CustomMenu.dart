import 'package:flutter/material.dart';
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final Function() onChangeVolumeMusic;
  final Function() onChangeVolumeSound;
  final Color? backgroundColor;
  final Color? radiusColor;
  final double? borderRadius;

  CustomMenu({
    Key? key,
    required this.title,
    required this.onChangeVolumeMusic,
    required this.onChangeVolumeSound,
    required this.backgroundColor,
    required this.radiusColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundDrawer(
      backgroundColor: backgroundColor,
      radiusColor: radiusColor,
      borderRadius: borderRadius,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: onChangeVolumeMusic,
              ),
              IconButton(
                icon: Icon(Icons.volume_up_outlined),
                onPressed: onChangeVolumeSound,
              ),
            ],
          ),
        ],
      ),
    );
  }
}