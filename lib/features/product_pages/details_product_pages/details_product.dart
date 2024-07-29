import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_desktop.dart';
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_tablet.dart';
import 'package:simple_coffee/features/product_pages/details_product_pages/details_product_page_mobile.dart';

class DetailsProduct extends StatefulWidget {

  final ScreenType screenType;

  const DetailsProduct({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const DetailsProductDesktop();
      case ScreenType.tablet:
        return const DetailsProductTablet();
      case ScreenType.mobile:
        return const DetailsProductMobile();
      default:
        return const DetailsProductMobile();
    }
  }
}