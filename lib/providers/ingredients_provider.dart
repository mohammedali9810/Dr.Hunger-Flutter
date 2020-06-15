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
  Map<String, bool> _vegetablesMap, _fruitsMap;
  Map<String, bool> get vegetables => {..._vegetablesMap};
  Map<String, bool> get fruits => {..._fruitsMap};
  Map<String, double> _ingredients = {};
  Map<String, double> get ingredients => {..._ingredients};

  void _init() {
    _vegetablesMap = Map<String, bool>.fromIterable(
      _vegetables,
      key: (element) => element,
      value: (_) => false,
    );
    _fruitsMap = Map<String, bool>.fromIterable(
      _fruits,
      key: (element) => element,
      value: (_) => false,
    );
  }

  void toggleItem(String item, bool isFruit) {
    (isFruit ? _fruitsMap : _vegetablesMap).update(item, (value) => !value);
    notifyListeners();
  }

  void removeFromMap(String item) {
    _ingredients.remove(item);
    notifyListeners();
  }

  void addToMap(String item, double value) {
    _ingredients.putIfAbsent(item, () => value);
    notifyListeners();
  }

  void updateMap(String item, double value) {
    _ingredients.update(item, (_) => value);
    notifyListeners();
  }
}
