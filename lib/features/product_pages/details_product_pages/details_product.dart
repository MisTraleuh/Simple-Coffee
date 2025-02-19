import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_desktop.dart';
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_tablet.dart';
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_mobile.dart';

class DetailsProduct extends StatefulWidget {

  final ScreenType screenType;
  final Map<String, dynamic> product;

  const DetailsProduct({
    Key? key,
    required this.screenType,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return DetailsProductDesktop(product: widget.product);
      case ScreenType.tablet:
        return DetailsProductTablet(product: widget.product);
      case ScreenType.mobile:
        return DetailsProductMobile(product: widget.product);
    }
  }
}