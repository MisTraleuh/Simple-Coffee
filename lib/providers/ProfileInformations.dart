/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class ProfileInformations extends ChangeNotifier {
  String emailIntput = "";
  String passwordInput = "";

  String get getEmailInput => emailIntput;
  String get getPasswordInput => passwordInput;

  void setEmailInput(String volume) {
    emailIntput = volume;
    notifyListeners();
  }

  void setPasswordInput(String volume) {
    passwordInput = volume;
    notifyListeners();
  }

}
