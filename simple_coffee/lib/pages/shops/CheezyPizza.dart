/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class CheezyPizza extends StatefulWidget {
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectPrice;
  
  const CheezyPizza({
    Key? key,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectPrice,
  }) : super(key: key);

  @override
  State<CheezyPizza> createState() => _CheezyPizzaState();
}

class _CheezyPizzaState extends State<CheezyPizza> {

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
              'logoPath'            : 'assets/chezzyPizza.jfif',
              'shopName'            : 'Cheezy Pizza - Verdun',
              'shopAddress'         : '4 Rue de Verdun, 34000 Montpellier, France',
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
              'Cheezy Pizza - Montpellier',
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
