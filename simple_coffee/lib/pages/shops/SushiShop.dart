/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class SushiShop extends StatefulWidget {
  final String collectDate;
  final String collectTime;
  final String collectNumberBasket;
  final String collectPrice;
  
  const SushiShop({
    Key? key,
    required this.collectDate,
    required this.collectTime,
    required this.collectNumberBasket,
    required this.collectPrice,
  }) : super(key: key);

  @override
  State<SushiShop> createState() => _SushiShopState();
}

class _SushiShopState extends State<SushiShop> {

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
              'logoPath'            : 'assets/sushiShop.jpg',
              'shopName'            : 'Sushi Shop - Montpellier Herbrerie',
              'shopAddress'         : '2 Rue de l\'Herbrerie, 34000 Montpellier, France',
              'collectDate'         : widget.collectDate,
              'collectTime'         : widget.collectTime,
              'collectNumberBasket' : widget.collectNumberBasket,
              'collectBasketType'   : 'Panier Mixte (Moyen)',
              'collectPrice'        : widget.collectPrice,
            }
          );
        },
        child: CustomBackgroundDrawer(
          backgroundColor: Colors.white,
          radiusColor: Colors.blueGrey[100]!,
          child: const Center(
            child: Text(
              'Sushi Shop - Montpellier Herbrerie',
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
