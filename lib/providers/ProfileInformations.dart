/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class ProfileInformations extends ChangeNotifier {
  String emailIntput = "";
  String passwordInput = "";
  String confirmPasswordInput = "";
  String usernameInput = "";

  String get getEmailInput => emailIntput;
  String get getPasswordInput => passwordInput;
  String get getConfirmPasswordInput => confirmPasswordInput;
  String get getUsernameInput => usernameInput;

  void setEmailInput(String volume) {
    emailIntput = volume;
    notifyListeners();
  }

  void setPasswordInput(String volume) {
    passwordInput = volume;
    notifyListeners();
  }

  void setConfirmPasswordInput(String volume) {
    confirmPasswordInput = volume;
    notifyListeners();
  }

  void setUsernameInput(String volume) {
    usernameInput = volume;
    notifyListeners();
  }
}
