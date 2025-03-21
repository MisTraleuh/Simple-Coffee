import 'package:flutter/material.dart';

class FavoriteProductProvider extends ChangeNotifier {
  List<dynamic> _selectedProduct = [];

  List<dynamic> get selectedProduct => _selectedProduct;

  void setSelectedProduct(List<dynamic> product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void addSelectedProduct(dynamic product) {
    _selectedProduct.add(product);
    notifyListeners();
  }

  void removeSelectedProduct(dynamic product) {
    _selectedProduct.remove(product);
    notifyListeners();
  }
}
