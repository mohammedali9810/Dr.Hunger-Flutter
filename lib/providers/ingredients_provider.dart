import 'package:flutter/material.dart';

class Ingredients with ChangeNotifier {
  Ingredients() {
    _init();
  }
  final List<String> _vegetables = [
    'Meat',
    'Potatoes',
    'Chickens',
    'Rice',
    'Tomatoes',
    'Pepper',
  ];
  final List<String> _fruits = [
    'Apple',
    'Orange',
    'Peach',
    'Apricot',
    'Mango',
    'Strawberry',
  ];
  Map<String, bool> _vegMap, _fruitsMap;
  Map<String, bool> get vegetables => {..._vegMap};
  Map<String, bool> get fruits => {..._fruitsMap};
  Map<String, int> _ingredients = {};
  Map<String, int> get ingredients => {..._ingredients};

  void _init() {
    _vegMap = Map<String, bool>.fromIterable(
      _vegetables,
      key: (element) => element,
      value: (_) => false,
    );
    _fruitsMap = Map<String, bool>.fromIterable(
      _fruits,
      key: (element) => element,
      value: (_) => false,
    );
    // ----------------------------
    // for test purposes only
    // ----------------------------
    _vegMap['Tomatoes'] =
        _vegMap['Potatoes'] = _vegMap['Chickens'] = _vegMap['Rice'] = true;
    _fruitsMap['Orange'] =
        _fruitsMap['Apple'] = _fruitsMap['Strawberry'] = true;
    _ingredients = {
      'Tomatoes': 312,
      'Potatoes': 350,
      'Chickens': 474,
      'Rice': 530,
      'Orange': 312,
      'Apple': 273,
      'Strawberry': 180,
    };
    // ---------------------------
  }

  void toggleItem(String item) {
    (_fruitsMap.containsKey(item) ? _fruitsMap : _vegMap)
        .update(item, (value) => !value);
    notifyListeners();
  }

  void removeFromMap(String item) {
    _ingredients.remove(item);
    notifyListeners();
  }

  void addToMap(String item, int value) {
    _ingredients.putIfAbsent(item, () => value);
    notifyListeners();
  }

  void updateMap(String item, int value) {
    _ingredients.update(item, (_) => value);
    notifyListeners();
  }
}
