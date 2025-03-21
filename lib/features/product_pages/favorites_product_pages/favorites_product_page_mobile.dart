import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_coffee/shared/providers/pages/favorite_product_provider.dart';
import 'package:simple_coffee/shared/providers/pages/home_page_provider.dart';
import "package:simple_coffee/models/buttons/ButtonsRow.dart";
import "package:simple_coffee/models/cards/CustomCard.dart";
import "package:simple_coffee/models/bars/shared_bottom_nav_bar.dart";

class FavoritesProductPageMobile extends StatefulWidget {

  const FavoritesProductPageMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesProductPageMobile> createState() => _FavoritesProductPageMobileState();
}

class _FavoritesProductPageMobileState extends State<FavoritesProductPageMobile> {

  @override
  void initState() {
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    final favoriteProductProvider = Provider.of<FavoriteProductProvider>(context);
    final homePageModel = Provider.of<HomePageProvider>(context);
    final products = favoriteProductProvider.selectedProduct;

    return Scaffold(
      bottomNavigationBar: SharedBottomNavBar(
        selectedIndex: homePageModel.selectedIndex,
        onItemTapped: (index) => homePageModel.onItemTapped(context, index),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ButtonsRow(
              buttonNames: products.keys.toList(),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveColor: Colors.white,
              borderRadius: 10,
              onButtonPressed: (String name) {
                homePageModel.setSelectedButton(name);
              },
              activeButton: homePageModel.selectedButton,
              isActiveTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
              isInactiveTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
              buttonSize: const Size(100, 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth;
                double cardWidth = 200;
                int cardsPerRow = (maxWidth / cardWidth).floor();

                return Wrap(
                  spacing: 10.0,
                  runSpacing: 15.0,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    products[homePageModel.selectedButton]!.length,
                    (index) {
                      return SizedBox(
                        width: (maxWidth / cardsPerRow) - 10,
                        height: 300,
                        child: CustomCard(
                          imagePath: products[homePageModel.selectedButton]![index]['imagePath']!,
                          rating: products[homePageModel.selectedButton]![index]['rating']!,
                          nameType: products[homePageModel.selectedButton]![index]['nameType']!,
                          withAdding: products[homePageModel.selectedButton]![index]['withAdding']!,
                          price: products[homePageModel.selectedButton]![index]['price']!,
                          buttonColor: Theme.of(context).colorScheme.primary,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details-product',
                              arguments: products[homePageModel.selectedButton]![index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}