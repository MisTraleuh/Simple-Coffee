import 'package:flutter/material.dart';
import 'package:simple_coffee/shared/immutables/user_cache.dart';

class ProfileInformationCache with ChangeNotifier {
  UserPreferences _userPreferences = const UserPreferences.unknown();

  UserPreferences get userPreferences => _userPreferences;

  void updateEmail(String email, bool updateCache) {
    _userPreferences = _userPreferences.copyWith(email: email);
    if (updateCache == true) {
      UserPreferences.saveUserPreferences(_userPreferences);
    }
    notifyListeners();
  }

  void updatePassword(String password, bool updateCache) {
    _userPreferences = _userPreferences.copyWith(password: password);
    if (updateCache == true) {
      UserPreferences.saveUserPreferences(_userPreferences);
    }
    notifyListeners();
  }

  void updateConfirmPassword(String confirmedPassword, bool updateCache) {
    _userPreferences = _userPreferences.copyWith(confirmedPassword: confirmedPassword);
    if (updateCache == true) {
      UserPreferences.saveUserPreferences(_userPreferences);
    }
    notifyListeners();
  }

  void updateUsername(String username, bool updateCache) {
    _userPreferences = _userPreferences.copyWith(username: username);
    if (updateCache == true) {
      UserPreferences.saveUserPreferences(_userPreferences);
    }
    notifyListeners();
  }

  void updateIsAlreadyRegistered(bool isAlreadyRegistered, bool updateCache) {
    _userPreferences = _userPreferences.copyWith(isAlreadyRegistered: isAlreadyRegistered);
    if (updateCache == true) {
      UserPreferences.saveUserPreferences(_userPreferences);
    }
    notifyListeners();
  }

  bool isPasswordIdentical() {
    return _userPreferences.password == _userPreferences.confirmedPassword;
  }

  Future<void> loadUser() async {
    _userPreferences = await UserPreferences.getUserPreferences();
    notifyListeners();
  }

  Future<bool> isAlreadyRegistered() async {
    await loadUser();
    return _userPreferences.isAlreadyRegistered;
  }

  void setUser(UserPreferences userPreferences) {
    _userPreferences = userPreferences;
    UserPreferences.saveUserPreferences(userPreferences);
    notifyListeners();
  }

  void clearUser() {
    _userPreferences = const UserPreferences.unknown();
    UserPreferences.saveUserPreferences(_userPreferences);
    notifyListeners();
  }
}
