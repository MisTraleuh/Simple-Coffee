import 'package:flutter/material.dart';
import 'package:simple_coffee/shared/immutables/user.dart';

class ProfileInformation extends ChangeNotifier {
  User _profile = const User.unknown();

  User get profile => _profile;

void updateEmail(String email) {
  _profile = _profile.copyWith(email: email);
  notifyListeners();
}

  void updatePassword(String password) {
    _profile = _profile.copyWith(password: password);
    notifyListeners();
  }

  void updateConfirmPassword(String confirmedPassword) {
    _profile = _profile.copyWith(confirmedPassword: confirmedPassword);
    notifyListeners();
  }

  void updateUsername(String username) {
    _profile = _profile.copyWith(username: username);
    notifyListeners();
  }
}
