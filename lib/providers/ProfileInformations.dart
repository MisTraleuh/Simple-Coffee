import 'package:flutter/material.dart';

class ProfileInformations extends ChangeNotifier {
  String _emailInput = "";
  String _passwordInput = "";
  String _confirmPasswordInput = "";
  String _usernameInput = "";

  String get emailInput => _emailInput;
  String get passwordInput => _passwordInput;
  String get confirmPasswordInput => _confirmPasswordInput;
  String get usernameInput => _usernameInput;

  void setEmailInput(String volume) {
    _emailInput = volume;
    notifyListeners();
  }

  void setPasswordInput(String volume) {
    _passwordInput = volume;
    notifyListeners();
  }

  void setConfirmPasswordInput(String volume) {
    _confirmPasswordInput = volume;
    notifyListeners();
  }

  void setUsernameInput(String volume) {
    _usernameInput = volume;
    notifyListeners();
  }
}
