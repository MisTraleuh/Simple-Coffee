/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'package:simple_coffee/commons/WaterEffectButton.dart';

class RecuperationSection extends StatefulWidget {

  final bool isFinished;
  final VoidCallback onWaitingProcess;
  final VoidCallback onFinish;

  const RecuperationSection({
    Key? key,
    required this.isFinished,
    required this.onWaitingProcess,
    required this.onFinish,
  }) : super(key: key);

  @override
  State<RecuperationSection> createState() => _RecuperationSectionState();
}

class _RecuperationSectionState extends State<RecuperationSection> {

  @override
  Widget build(BuildContext context) {

    if (widget.isFinished == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          WaterEffectButton(),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
            child: Text(
              "Collecte validée",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 14, 101, 93),
                fontWeight: FontWeight.w900,
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.only(top: 1.0, left: 15.0, right: 15.0),
            child: Text(
              "Montrez l'écran au commerçant pour récupérer",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
            child: Text(
              "votre panier !",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          child: Text(
            "Validez ci-dessous et montrez l'écran au commerçant.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          )
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            "Assurez-vous de ne confirmer qu'une fois que vous êtes",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          )
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            "chez le commerçant pour récuperer votre panie.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 17, 64, 61),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: SwipeableButtonView(
              buttonText: "Commande récupérée",
              buttonColor: const Color.fromARGB(255, 14, 101, 93),
              buttontextstyle: const TextStyle(
                color: Color.fromARGB(255, 14, 101, 93),
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
              buttonWidget: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
              ),
              activeColor: Colors.white,
              isFinished: widget.isFinished,
              onWaitingProcess: widget.onWaitingProcess,
              onFinish: widget.onFinish,
            ),
          ),
        ),
      ],
    );
  }

}
