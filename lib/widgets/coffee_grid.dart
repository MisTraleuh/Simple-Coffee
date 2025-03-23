import 'package:flutter/material.dart';

final Map<String, String> imagesMap = {
  "Cappuccino": "assets/app/products_assets/cappuccinos/cappuccino_1.png",
  "Machiato": "assets/app/products_assets/machiatos/machiato_1.png",
  "Latte": "assets/app/products_assets/lattes/latte_1.png",
  "Expresso": "assets/app/products_assets/expressos/expresso_1.png",
  "Americano": "assets/app/products_assets/americanos/americano_1.png",
  "Mocha": "assets/app/products_assets/mochas/mocha_1.png",
  "Flat White": "assets/app/products_assets/lattes/latte_2.png",
  "Affogato": "assets/app/products_assets/expressos/expresso_2.png",
  "Cold Brew": "assets/app/products_assets/americanos/americano_2.png",
};

class IconsGrid extends StatelessWidget {
  final List<String> iconsNames;
  final int imagesPerRow;
  final double imageHeight;
  final double imageWidth;
  final TextStyle? textStyle;

  const IconsGrid({
    Key? key,
    required this.iconsNames,
    this.imagesPerRow = 4,
    this.imageHeight = 80,
    this.imageWidth = 80,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> availableCoffees = iconsNames
        .where((name) => imagesMap.containsKey(name))
        .toList();

    final int fullRows = availableCoffees.length ~/ imagesPerRow;
    final int itemsInLastRow = availableCoffees.length % imagesPerRow;
    final bool hasIncompleteRow = itemsInLastRow > 0;
    final int totalRows = fullRows + (hasIncompleteRow ? 1 : 0);

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: totalRows,
          itemBuilder: (context, rowIndex) {
            final bool isLastIncompleteRow = hasIncompleteRow && rowIndex == fullRows;
            
            final int startIndex = rowIndex * imagesPerRow;
            final int endIndex = isLastIncompleteRow
              ? availableCoffees.length
              : startIndex + imagesPerRow;
            
            final List<String> rowCoffees = availableCoffees.sublist(startIndex, endIndex);
            
            final double containerWidth = constraints.maxWidth - 16;
            final double itemWidth = containerWidth / imagesPerRow;
            final double totalItemsWidth = rowCoffees.length * itemWidth;
            final double emptySpace = containerWidth - totalItemsWidth;
            final double leadingPadding = isLastIncompleteRow ? emptySpace / 2 : 0;
            
            return Padding(
              padding: EdgeInsets.only(
                top: 10, 
                bottom: 10, 
                left: leadingPadding
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rowCoffees.map((coffeeName) {
                  return SizedBox(
                    width: itemWidth,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagesMap[coffeeName]!,
                            height: imageHeight,
                            width: imageWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          coffeeName,
                          style: textStyle ?? const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          },
        );
      }
    );
  }
}
