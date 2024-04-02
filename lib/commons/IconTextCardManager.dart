

class IconTextCardManager {
  int _nextId = 0;
  final Map<int, Map<String, dynamic>> _items = {};

  int push({
    required int idValue,
    required String iconUrl,
    required String name,
    required String authenticationType,
    required String oauthUrl,
    required String authRoute,
    required String authFields,
  }) {
    final int id = _nextId++;
    _items[id] = {
      "id": idValue,
      "iconUrl": iconUrl,
      "name": name,
      "authenticationType": authenticationType,
      "oauthUrl": oauthUrl,
      "authRoute": authRoute,
      "authFields": authFields,
    };
    return id;
  }

  void remove(int id) {
    _items.remove(id);
  }

  Map<String, dynamic> getById(int idValue) {
    return _items.values.firstWhere(
      (item) => item["id"] == idValue,
    );
  }

  List<Map<String, dynamic>> getAll() {
    return _items.values.toList();
  }

  void clear() {
    _items.clear();
  }

}
