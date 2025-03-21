import 'package:flutter/material.dart';

class FavoriteProductProvider extends ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> _selectedProduct = {
    "Cappuccinos": [],
    "Machiatos": [],
    "Lattes": [],
    "Espressos": [],
    "Americanos": [],
    "Mochas": [],
  };

  Map<String, List<Map<String, dynamic>>> get selectedProduct => _selectedProduct;

  void setSelectedProduct(Map<String, List<Map<String, dynamic>>> products) {
    _selectedProduct = products;
    notifyListeners();
  }

  void addSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.add(product);
    notifyListeners();
  }

  void removeSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.remove(product);
    notifyListeners();
  }
}
