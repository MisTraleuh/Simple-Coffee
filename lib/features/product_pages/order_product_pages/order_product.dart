import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/product_pages/order_product_pages/order_product_desktop.dart';
import 'package:simple_coffee/features/product_pages/order_product_pages/order_product_tablet.dart';
import 'package:simple_coffee/features/product_pages/order_product_pages/order_product_mobile.dart';

class OrderProduct extends StatelessWidget {
  final ScreenType screenType;
  final Map<String, dynamic>? arguments;

  const OrderProduct({
    Key? key,
    required this.screenType,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = arguments ?? 
        (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {});
    
    switch (screenType) {
      case ScreenType.desktop:
        return OrderProductDesktop(
          product: args['product'],
          selectedSize: args['selectedSize'],
        );
      case ScreenType.tablet:
        return OrderProductTablet(
          product: args['product'],
          selectedSize: args['selectedSize'],
        );
      case ScreenType.mobile:
        return OrderProductMobile(
          product: args['product'],
          selectedSize: args['selectedSize'],
        );
    }
  }
}