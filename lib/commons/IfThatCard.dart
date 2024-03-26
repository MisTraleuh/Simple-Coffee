/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class CustomCardWithButton extends StatefulWidget {
  final String text;
  final bool isDark;

  CustomCardWithButton({
    Key? key,
    required this.text,
    required this.isDark,
  }) : super(key: key);

  @override
  _CustomCardWithButtonState createState() => _CustomCardWithButtonState();
}

class _CustomCardWithButtonState extends State<CustomCardWithButton> {
  bool isFirstButtonClicked = false;
  bool isSecondButtonClicked = false;
  var datas;
  String? _receivedTitleFirstButton;
  String? _receivedLabelFirstButton;
  String? _receivedTitleSecondButton;
  String? _receivedLabelSecondButton;

  @override
  Widget build(BuildContext context) {
    Color? textColor = widget.isDark ? Colors.black : Colors.white;
    Color? iconColor = isFirstButtonClicked ? textColor : Colors.grey;
    // Color? buttonColor = isFirstButtonClicked ? Colors.grey : Colors.white;
    Color? buttonColor = widget.isDark ? Colors.black : Colors.white;
    Color? cardColor = widget.isDark ? Colors.white : Colors.black;
    Color? textButtonColor = widget.isDark ? Colors.white : Colors.black;
    Color? textNoSelectColor = widget.isDark ? Colors.grey[800] : Colors.grey[300];

    return Card(
      color: cardColor,
      margin: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 30.0, color: textColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                ),
                isFirstButtonClicked
                    ? Text(
                        // Utilisation de substring pour limiter la longueur du texte
                        "$_receivedTitleFirstButton - ${_receivedLabelFirstButton?.substring(0, 8) ?? ''}...",
                        style: TextStyle(color: textColor, fontSize: 18.0),
                      )
                    // Text("$_receivedTitleFirstButton - $_receivedLabelFirstButton", style: TextStyle(color: textColor, fontSize: 18.0))
                    : ElevatedButton(
                        onPressed: () async {
                          final datas = await Navigator.pushNamed(context, '/selectService');
                          if (datas != null) {
                            Map<String, dynamic> results = datas as Map<String, dynamic>;
                            setState(() {
                              isFirstButtonClicked = true;
                              _receivedTitleFirstButton = results['title'];
                              _receivedLabelFirstButton = results['label'];
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: buttonColor),
                        child: Text('Ajouter', style: TextStyle(color: textButtonColor)),
                ),
              ],
            ),
          ),
          Icon(Icons.add_circle, color: iconColor, size: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( 
                  'Then That',
                  style: TextStyle(fontSize: isFirstButtonClicked? 30 : 20, color: iconColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                ),
                isSecondButtonClicked
                  ? Text(
                    "$_receivedTitleSecondButton - ${_receivedLabelSecondButton?.substring(0, 4) ?? ''}...",
                    style: TextStyle(color: textColor, fontSize: 18.0))
                  : ElevatedButton(
                  onPressed: isFirstButtonClicked ? () async {
                    final datas = await Navigator.pushNamed(context, '/selectService');
                    if (datas != null) {
                      Map<String, dynamic> results = datas as Map<String, dynamic>;
                      print('IN CUSTOM CARD WITH BUTTON');
                      print(results);
                      setState(() {
                        isSecondButtonClicked = true;
                        _receivedTitleSecondButton = results['title'];
                        _receivedLabelSecondButton = results['label'];
                      });
                    }
                  } : null,
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    onSurface: Colors.grey,
                  ),
                  child: Text('Ajouter', style: TextStyle(color: isFirstButtonClicked? textButtonColor: textNoSelectColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

