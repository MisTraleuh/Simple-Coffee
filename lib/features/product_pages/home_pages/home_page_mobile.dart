import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import "package:simple_coffee/models/buttons/ButtonsRow.dart";
import "package:simple_coffee/models/cards/CustomCard.dart";
import "package:simple_coffee/models/cards/ImageCard.dart";
import "package:simple_coffee/models/text/promo_text_widget.dart";
import "package:simple_coffee/models/bars/shared_bottom_nav_bar.dart";

import "package:simple_coffee/data/products_lists.dart";

import 'package:provider/provider.dart';
import 'package:simple_coffee/shared/providers/profile_information_cache.dart';
import 'package:simple_coffee/shared/providers/pages/home_page_provider.dart';

class HomeMobile extends StatefulWidget {

  const HomeMobile({
    Key? key
  }) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {

  bool _passed = false;

  @override
  Widget build(BuildContext context) {
    final profileInformationCache = Provider.of<ProfileInformationCache>(context);
    final homePageModel = Provider.of<HomePageProvider>(context);

    if (!_passed) {
      profileInformationCache.loadUser();
      _passed = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SharedBottomNavBar(
        selectedIndex: homePageModel.selectedIndex,
        onItemTapped: (index) => homePageModel.onItemTapped(context, index),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF131313),
                      Color(0xFF313131),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Column(
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        'Montpellier, France',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                        maxLines: 1,
                                        minFontSize: 10,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/app/products_assets/avatar.png'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.search, color: Colors.white),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                "Search coffee",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                                ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.filter_list, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, right: 20, left: 20),
                child: Center(
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ImageCard(
                      imagePath: "assets/app/products_assets/coffee_promo.png",
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'Promo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const SizedBox(
                                height: 50,
                                child: PromoTextWidget(
                                  text: "Get 50% off\non your first order",
                                  textSize: 15,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double maxWidth = constraints.maxWidth;
                              double cardWidth = 200;
                              int cardsPerRow = (maxWidth / cardWidth).floor();

                              return SingleChildScrollView(
                                child: Wrap(
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
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
