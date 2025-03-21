import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

  FavoriteProductProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    
    if (favoritesJson != null) {
      Map<String, dynamic> decoded = jsonDecode(favoritesJson);
      Map<String, List<Map<String, dynamic>>> loadedFavorites = {};
      
      decoded.forEach((key, value) {
        loadedFavorites[key] = (value as List).map((item) => Map<String, dynamic>.from(item)).toList();
      });
      
      _selectedProduct = loadedFavorites;
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonData = {};
    _selectedProduct.forEach((key, value) {
      jsonData[key] = value;
    });
    
    await prefs.setString('favorites', jsonEncode(jsonData));
  }

  void setSelectedProduct(Map<String, List<Map<String, dynamic>>> products) {
    _selectedProduct = products;
    _saveFavorites();
    notifyListeners();
  }

  void addSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.add(product);
    _saveFavorites();
    notifyListeners();
  }

  void removeSelectedProduct(Map<String, dynamic> product) {
    _selectedProduct["${product['nameType']}s"]!.remove(product);
    _saveFavorites();
    notifyListeners();
  }
}
