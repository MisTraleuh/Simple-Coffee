/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/pages/HeaderSection.dart';
import 'package:simple_coffee/pages/ShopSection.dart';
import 'package:simple_coffee/pages/ValidationSection.dart';
import 'package:simple_coffee/pages/ConfirmationSection.dart';
import 'package:simple_coffee/pages/AjustBackgroundOnConfirmation.dart';
import 'package:simple_coffee/pages/BottomButton.dart';

class CommandePage extends StatefulWidget {

  const CommandePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CommandePage> createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  double _height = 0;

  void annulation() {
    setState(() {
      _height = 0;
    });
  }

  Future<void> _exitApp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('exitButtonPressed', true);
    // TODO: SEND EMAIL COMMAND ANNULATION
    exit(0);
  }

  @override
  void initState() {
    super.initState();
    _height = 0;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final logoPath = args['logoPath'];
    final shopName = args['shopName'];
    final shopAddress = args['shopAddress'];
    final collectDate = args['collectDate'];
    final collectTime = args['collectTime'];
    final collectNumberBasket = args['collectNumberBasket'];
    final collectBasketType = args['collectBasketType'];
    final collectPrice = args['collectPrice'];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 250),
      body: Stack(
        children: <Widget>[
          /********************************
          *         HEADER SECTION        *
          ********************************/
          const HeaderSection(),
          /********************************
          *         SHOP SECTION          *
          ********************************/
          ShopSection(
            logoPath: logoPath,
            shopName: shopName,
            shopAddress: shopAddress,
          ),
          /********************************
          *          DATE SECTION         *
          ********************************/
          Padding(
            padding: const EdgeInsets.only(top: 355.0, left: 15.0, right: 15.0),
            child: ValidationSection(
              collectDate: collectDate,
              collectTime: collectTime,
              collectNumberBasket: collectNumberBasket,
              collectBasketType: collectBasketType,
              collectPrice: collectPrice,
              onConfirm: () {
                setState(() {
                  _height = (MediaQuery.of(context).size.height / 2);
                });
              },
              onPanik: _exitApp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 755.0,
              left: MediaQuery.of(context).size.width / 2 - 50,
            ),
            child: BottomButton(
              onPanik: _exitApp,
            ),
          ),
          /********************************
          *      CONFIRMATION SECTION     *
          ********************************/
          AjustBackgroundOnConfirmation(
            height: _height,
            onConfirm: annulation,
          ),
          ConfirmationSection(
            height: _height,
            onConfirm: annulation,
            collectNumberBasket: collectNumberBasket,
            shopAddress: shopAddress,
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height),
            child: const Text(''),
          )
        ],
      ),
    );
  }
}
