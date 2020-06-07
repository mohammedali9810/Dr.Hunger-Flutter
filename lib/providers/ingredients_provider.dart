import 'package:flutter/material.dart';

class Ingredients with ChangeNotifier {
  Map<String, bool> _vegetables = {
    'Meat': false,
    'Potatoes': false,
    'Chickens': false,
    'Rice': false,
    'Tomatoes': false,
    'Pepper': false,
  };
  Map<String, bool> _fruits = {
    'Apple': false,
    'Orange': false,
    'Peach': false,
    'Apricot': false,
    'Mango' : false,
    'Strawberry' : false,
  };
  Map<String, double> _ingredients = {};
  
  Map<String, bool> get vegetables => {..._vegetables};
  Map<String, bool> get fruits => {..._fruits};
  Map<String, double> get ingredients => {..._ingredients};

  void toggleItem(String item, bool isFruit) {
    (isFruit ? _fruits : _vegetables).update(item, (value) => !value);
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
