import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  String selectedButton = "Cappuccinos";
  bool _passed = false;
  int _selectedIndex = 0;

  bool get passed => _passed;
  int get selectedIndex => _selectedIndex;

  void setPassed(bool value) {
    _passed = value;
    notifyListeners();
  }

  void setSelectedButton(String button) {
    selectedButton = button;
    notifyListeners();
  }

  void onItemTapped(BuildContext context, int index) {
    _selectedIndex = index;
    notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/favorites');
        break;
      case 2:
        Navigator.pushNamed(context, '/lock');
        break;
      case 3:
        Navigator.pushNamed(context, '/notifications');
        break;
    }
  }
}
