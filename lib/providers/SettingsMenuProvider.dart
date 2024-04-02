import 'package:flutter/material.dart';

class SettingsMenuProvider extends ChangeNotifier {
  int _volume = 0;

  int get volume => _volume;

  void setVolume(int volume) {
    _volume = volume;
    notifyListeners();
  }
}