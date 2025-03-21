import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_coffee/shared/providers/pages/favorite_product_provider.dart';

class FavoritesProductPageTablet extends StatefulWidget {

  const FavoritesProductPageTablet({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesProductPageTablet> createState() => _FavoritesProductPageTabletState();
}

class _FavoritesProductPageTabletState extends State<FavoritesProductPageTablet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProductProvider = Provider.of<FavoriteProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: favoriteProductProvider.selectedProduct.length,
          itemBuilder: (context, index) {
            return Text(favoriteProductProvider.selectedProduct[index]['nameType']);
          },
        ),
      ),
    );
  }
}