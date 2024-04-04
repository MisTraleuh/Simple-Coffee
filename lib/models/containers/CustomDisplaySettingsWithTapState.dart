import 'package:flutter/material.dart';

/**************************
*     COMMONS IMPORTS     *
**************************/
import 'package:simple_coffee/models/containers/CustomButtonBlackAndWhite.dart';
import 'package:simple_coffee/models/containers/CustomMenu.dart';

class CustomDisplaySettingsWithTap extends StatefulWidget {
  final String title;
  final Function() onTap;
  final bool isMenu;
  final double heightScreen;
  final double widthScreen;

  const CustomDisplaySettingsWithTap({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isMenu,
    required this.heightScreen,
    required this.widthScreen,
  }) : super(key: key);

  @override
  CustomDisplaySettingsWithTapState createState() => CustomDisplaySettingsWithTapState();
}

class CustomDisplaySettingsWithTapState extends State<CustomDisplaySettingsWithTap> {
  @override
  Widget build(BuildContext context) {
    return widget.isMenu ?
      Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: widget.widthScreen * 0.1),
          child: SizedBox(
            child: CustomMenu(
              title: widget.title,
              onChangeVolumeMusic: () {},
              onChangeVolumeSound: () {},
              backgroundColor: Colors.pinkAccent,
              radiusColor: Colors.black,
              borderRadius: 20.0,
            ),
          ),
        ),
      )
      :
      Positioned(
        top: widget.heightScreen * 0.05,
        left: widget.widthScreen * 0.28,
        child: CustomButtonBlackAndWhite(
          text: widget.title,
          borderRadius: 20.0,
          onPressed: widget.onTap,
        ),
      );
  }
}
