import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagProvider extends ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> _selectedProduct = {
    "Cappuccinos": [],
    "Machiatos": [],
    "Lattes": [],
    "Espressos": [],
    "Americanos": [],
    "Mochas": [],
  };

  Map<String, List<Map<String, dynamic>>> get selectedProduct => _selectedProduct;

  ShoppingBagProvider() {
    loadShoppingBag();
  }

  Future<void> loadShoppingBag() async {
    final prefs = await SharedPreferences.getInstance();
    final shoppingBagJson = prefs.getString('shoppingBag');
    
    if (shoppingBagJson != null) {
      Map<String, dynamic> decoded = jsonDecode(shoppingBagJson);
      Map<String, List<Map<String, dynamic>>> loadedShoppingBag = {};
      
      decoded.forEach((key, value) {
        loadedShoppingBag[key] = (value as List).map((item) => Map<String, dynamic>.from(item)).toList();
      });
      
      _selectedProduct = loadedShoppingBag;
      notifyListeners();
    }
  }

  Future<void> _saveShoppingBag() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData = {};
    _selectedProduct.forEach((key, value) {
      jsonData[key] = value;
    });
    
    await prefs.setString('shoppingBag', jsonEncode(jsonData));
  }

  void setSelectedProduct(Map<String, List<Map<String, dynamic>>> products) {
    _selectedProduct = products;
    _saveShoppingBag();
    notifyListeners();
  }

  void addSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.add(product);
    _saveShoppingBag();
    notifyListeners();
  }

  void removeSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.remove(product);
    _saveShoppingBag();
    notifyListeners();
  }
}
