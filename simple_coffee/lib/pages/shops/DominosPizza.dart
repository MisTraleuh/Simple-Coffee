/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class DominosPizza extends StatefulWidget {
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectPrice;
  
  const DominosPizza({
    Key? key,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectPrice,
  }) : super(key: key);

  @override
  State<DominosPizza> createState() => _DominosPizzaState();
}

class _DominosPizzaState extends State<DominosPizza> {

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
              'logoPath'            : 'assets/dominosPizza.png',
              'shopName'            : 'Domino\'s Pizza - Montpellier Sud',
              'shopAddress'         : '3 Av. de Toulouse, 34000 Montpellier, France',
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
              'Domino\'s Pizza - Montpellier Sud',
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
