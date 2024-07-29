import "dart:io";

import 'package:flutter/material.dart';

import "package:simple_coffee/models/cards/ImageCard.dart";
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

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: height * 0.35,
                width: width,
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
                  padding: EdgeInsets.only(right: width * 0.08, left: width * 0.08, top: height * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Montpellier, France',
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CircleAvatar(
                              backgroundImage: AssetImage('assets/app/products_assets/avatar.png'),
                            ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width * 0.02),
                            const Icon(Icons.search, color: Colors.white),
                            SizedBox(width: width * 0.02),
                            
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search coffee',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.05,
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
                padding: EdgeInsets.only(top: height * 0.26, right: width * 0.08, left: width * 0.08),
                child: Center(
                  child: SizedBox(
                    height: height * 0.2,
                    width: width,
                    child: ImageCard(
                      imagePath: "assets/app/products_assets/coffee_promo.png",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Promo',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 30,
                                child: Container(
                                  color: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 25,
                                bottom: 2,
                                child: Container(
                                  color: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                ),
                              ),
                              const Text(
                                'Buy one get\none FREE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.47),
                child: Center(
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
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.55, right: width * 0.08, left: width * 0.08),
                child: SizedBox(
                  height: height * 0.45,
                  width: width,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 25.0,
                      childAspectRatio: 0.60,
                    ),
                    itemCount: products[selectedButton]!.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        imagePath: products[selectedButton]![index]['imagePath']!,
                        rating: products[selectedButton]![index]['rating']!,
                        nameType: products[selectedButton]![index]['nameType']!,
                        description: products[selectedButton]![index]['description']!,
                        price: products[selectedButton]![index]['price']!,
                        buttonColor: Theme.of(context).colorScheme.primary,
                      );
                    },
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
