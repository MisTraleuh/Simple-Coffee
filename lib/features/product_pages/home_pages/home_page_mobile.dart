import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import "package:simple_coffee/models/buttons/ButtonsRow.dart";
import "package:simple_coffee/models/cards/CustomCard.dart";

import "package:simple_coffee/data/products_lists.dart";

import 'package:provider/provider.dart';
import 'package:simple_coffee/shared/providers/profile_information_cache.dart';

class HomeMobile extends StatefulWidget {

  const HomeMobile({
    Key? key
  }) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {

  String selectedButton = "Cappuccinos";
  bool _passed = false;

  @override
  Widget build(BuildContext context) {
    final profileInformationCache = Provider.of<ProfileInformationCache>(context);

    if (!_passed) {
      profileInformationCache.loadUser();
      _passed = true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                          Flexible(
                            child: 
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/app/products_assets/avatar.png'),
                          ),
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
                          double screenHeight = constraints.maxHeight;
                          double screenWidth = constraints.maxWidth;

                        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: screenHeight * 0.25,
                            width: screenWidth * 0.2,
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
                          SizedBox(height: screenHeight * 0.05),
                          SizedBox(
                            height: screenHeight * 0.7,
                            child: const PromoTextWidget(
                              text: "Get 50% off\non your first order",
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
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: ButtonsRow(
                          buttonNames: productsName,
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveColor: Colors.white70,
                          borderRadius: 10,
                          onButtonPressed: (String name) {
                            setState(() {
                              selectedButton = name;
                            });
                          },
                          isActiveTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
                          isInactiveTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
                          buttonSize: const Size(100, 60),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 2.0,
                              childAspectRatio: 0.6,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: products[selectedButton]!.length,
                            itemBuilder: (context, index) {
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  return CustomCard(
                                    imagePath: products[selectedButton]![index]['imagePath']!,
                                    rating: products[selectedButton]![index]['rating']!,
                                    nameType: products[selectedButton]![index]['nameType']!,
                                    description: products[selectedButton]![index]['description']!,
                                    price: products[selectedButton]![index]['price']!,
                                    buttonColor: Theme.of(context).colorScheme.primary,
                                    parentConstraints: constraints,
                                  );
                                },
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


class ImageCard extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const ImageCard({
    Key? key,
    required this.imagePath,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class PromoTextWidget extends StatelessWidget {
  final String text;

  const PromoTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: text.split("\n").asMap().entries.map((entry) {
            int index = entry.key;
            String line = entry.value;

            return Positioned(
              top: index * 30.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                color: Colors.black,
                child: AutoSizeText(
                  line,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  minFontSize: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

