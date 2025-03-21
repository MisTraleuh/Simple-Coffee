import 'package:flutter/material.dart';

// RESPONSIVE TOOLS
import 'package:simple_coffee/shared/responsive/screen_type.dart';

// RESPONSIVE PAGES
import 'package:simple_coffee/features/product_pages/favorites_product_pages/favorites_product_page_desktop.dart';
import 'package:simple_coffee/features/product_pages/favorites_product_pages/favorites_product_page_tablet.dart';
import 'package:simple_coffee/features/product_pages/favorites_product_pages/favorites_product_page_mobile.dart';

class FavoritesProduct extends StatefulWidget {

  final ScreenType screenType;

  const FavoritesProduct({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  State<FavoritesProduct> createState() => _FavoritesProductState();
}

class _FavoritesProductState extends State<FavoritesProduct> {

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      case ScreenType.desktop:
        return const FavoritesProductPageDesktop();
      case ScreenType.tablet:
        return const FavoritesProductPageTablet();
      case ScreenType.mobile:
        return const FavoritesProductPageMobile();
    }
  }
}