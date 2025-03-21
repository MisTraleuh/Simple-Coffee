import 'package:flutter/material.dart';

import 'package:simple_coffee/models/buttons/SizeSelector.dart';

import 'package:provider/provider.dart';
import 'package:simple_coffee/shared/providers/pages/details_product_provider.dart';
import 'package:simple_coffee/shared/providers/pages/favorite_product_provider.dart';

class DetailsProductMobile extends StatefulWidget {

  final Map<String, dynamic> product;

  const DetailsProductMobile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsProductMobile> createState() => _DetailsProductMobileState();
}

class _DetailsProductMobileState extends State<DetailsProductMobile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsProductProvider = Provider.of<DetailsProductProvider>(context);
    final favoriteProductProvider = Provider.of<FavoriteProductProvider>(context);
    final isFavorite = favoriteProductProvider.selectedProduct.contains(widget.product);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                if (isFavorite) {
                  favoriteProductProvider.removeSelectedProduct(widget.product);
                } else {
                  favoriteProductProvider.addSelectedProduct(widget.product);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Image.asset(
                        widget.product['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product['nameType'],
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product['withAdding'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.product['rating'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(${widget.product['review']})',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("assets/app/icons/bean.png", width: 35, height: 35),
                          const SizedBox(width: 20),
                          Image.asset("assets/app/icons/milk.png", width: 35, height: 35),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product['description'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Size',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizeSelector(
                      sizes: widget.product['sizes'],
                      onIndexChanged: (index) {
                        detailsProductProvider.setSelectedIndex(index);
                      },
                      onContentChanged: (content) {
                        detailsProductProvider.setSelectedButton(content);
                      },
                      selectedIndex: detailsProductProvider.selectedIndex,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$ ${widget.product['price']}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            minimumSize: const Size(150, 80),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}