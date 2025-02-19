import 'package:flutter/material.dart';

class DetailsProductProvider extends ChangeNotifier {
  String selectedButton = "M";
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedButton(String button) {
    selectedButton = button;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
