/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class MarieBlachereComedie extends StatefulWidget {
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectPrice;
  
  const MarieBlachereComedie({
    Key? key,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectPrice,
  }) : super(key: key);

  @override
  State<MarieBlachereComedie> createState() => _MarieBlachereComedieState();
}

class _MarieBlachereComedieState extends State<MarieBlachereComedie> {

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
              'logoPath'            : 'assets/marie.png',
              'shopName'            : 'Le Café de Marie - Montpellier',
              'shopAddress'         : '26 Rue de la Loge, 34000 Montpellier, France',
              'collectDate'         : widget.collectDate,
              'collectTime'         : widget.collectTime,
              'collectNumberBasket' : widget.collectNumberBasket,
              'collectBasketType'   : 'Panier Mixte (Petit)',
              'collectPrice'        : widget.collectPrice,
            }
          );
        },
        child: CustomBackgroundDrawer(
          backgroundColor: Colors.white,
          radiusColor: Colors.blueGrey[100]!,
          child: const Center(
            child: Text(
              'Marie Comédie',
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
