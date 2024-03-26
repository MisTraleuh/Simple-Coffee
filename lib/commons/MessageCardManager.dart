/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

class MessageCardManager {
  int _nextId = 0;
  final Map<int, Map<String, dynamic>> _items = {};

  int push({
    required String message,
    required String description,
    required IconData icon1,
    required IconData icon2,
  }) {
    final int id = _nextId++;
    _items[id] = {
      'message': message,
      'description': description,
      'icon1': icon1,
      'icon2': icon2,
      'id': id,
    };
    return id;
  }

  void remove(int id) {
    _items.remove(id);
  }

  Map<String, dynamic>? getById(int id) {
    return _items[id];
  }

  List<Map<String, dynamic>> getAll() {
    return _items.values.toList();
  }
}
