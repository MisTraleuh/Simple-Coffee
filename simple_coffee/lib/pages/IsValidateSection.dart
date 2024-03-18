/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/ColoredCircle.dart';

class IsValidateSection extends StatefulWidget {

  IsValidateSection({
    Key? key,
  }) : super(key: key);

  @override
  State<IsValidateSection> createState() => _IsValidateSectionState();
}

class _IsValidateSectionState extends State<IsValidateSection> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Text(
                "Validez ci-dessous et montrez l'écran au commerçant.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Assurez-vous de ne confirmer qu'une fois que vous êtes",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "chez le commerçant pour récuperer votre panie.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              )
            ),
            SizedBox(height: 20),
            ColoredCircle(
              text: "Valider",
              circleColor: Colors.green,
              textColor: Colors.white,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
