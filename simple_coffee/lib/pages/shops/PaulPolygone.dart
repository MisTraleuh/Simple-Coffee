/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class PaulPolygone extends StatefulWidget {
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectPrice;
  
  const PaulPolygone({
    Key? key,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectPrice,
  }) : super(key: key);

  @override
  State<PaulPolygone> createState() => _PaulPolygoneState();
}

class _PaulPolygoneState extends State<PaulPolygone> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/commande',
            arguments: {
              'logoPath'            : 'assets/paul.png',
              'shopName'            : 'Paul - Montpellier - Polygone',
              'shopAddress'         : '1 Rue des Pertuisanes, 34000 Montpellier, France',
              'collectDate'         : widget.collectDate,
              'collectTime'         : widget.collectTime,
              'collectNumberBasket' : widget.collectNumberBasket,
              'collectBasketType'   : '',
              'collectPrice'        : widget.collectPrice,
            }
          );
        },
        child: CustomBackgroundDrawer(
          backgroundColor: Colors.white,
          radiusColor: Colors.blueGrey[100]!,
          child: const Center(
            child: Text(
              'Paul Polygone',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
