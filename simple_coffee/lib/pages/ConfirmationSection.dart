/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'dart:math';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';
import 'package:simple_coffee/commons/ColoredCircle.dart';
import 'package:simple_coffee/pages/RecuperationSection.dart';

class ConfirmationSection extends StatefulWidget {
  final double height;
  final VoidCallback onConfirm;
  final String collectNumberBasket;
  final String shopAddress;


  const ConfirmationSection({
    Key? key,
    required this.height,
    required this.onConfirm,
    required this.collectNumberBasket,
    required this.shopAddress,
  }) : super(key: key);

  @override
  State<ConfirmationSection> createState() => _ConfirmationSectionState();
}

class _ConfirmationSectionState extends State<ConfirmationSection> {
  bool isFinished = false;
  String ramdomNumber = "";

  void randomNumber() {
    const allPossible = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const nbChars = 11;
    final random = Random();
    String result = "";

    for (var i = 0; i < nbChars; i++) {
      result += allPossible[random.nextInt(allPossible.length)];
    }
    setState(() {
      ramdomNumber = result;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isFinished == false) {
      randomNumber();
    }

    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        child: CustomBackgroundDrawer(
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: 10,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 60.0),
                        child: Text(
                          "Commande à récupérer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onConfirm();
                        },
                        icon: const Icon(Icons.close),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ColoredCircle(
                    circleColor: const Color.fromARGB(255, 14, 101, 93),
                    textColor: Colors.white,
                    text: '${widget.collectNumberBasket}x',
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  "Panier Surprise",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.shopAddress,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: CustomBackgroundDrawer(
                    backgroundColor: const Color.fromARGB(255, 14, 101, 93),
                    borderRadius: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        ramdomNumber,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    height: 2,
                    color:const Color.fromARGB(255, 207, 207, 207),                     
                  ),
                ),
                CustomBackgroundDrawer(
                  backgroundColor: const Color.fromARGB(255, 255, 252, 250),
                  child: RecuperationSection(
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      setState(() {
                        isFinished = true;
                      });
                    },
                    onFinish: () async {
                      setState(() {
                        isFinished = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}