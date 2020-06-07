import 'package:flutter/material.dart';

import 'meal_provider.dart';

class Meals with ChangeNotifier{

  List <Meal> _meals = [
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'cookies',
        imageUrl: 'assets/images/food3.jpg',
        name: 'Good Meal'
    ),
    Meal(
        id: DateTime.now().toString(),
        description: 'Enjoy With Your Time',
        imageUrl: 'assets/images/food3.jpg',
        name: 'BREAKFAST'
    ),
  ];

  List<Meal>  get meals{
    return [..._meals];
  }
}