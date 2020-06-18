import 'package:flutter/material.dart';

class Meals with ChangeNotifier {
  List<Meal> _meals = [
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'cookies',
      imageUrl: 'assets/images/food3.jpg',
      name: 'Good Meal',
    ),
    Meal(
      id: DateTime.now().toString(),
      description: 'Enjoy With Your Time',
      imageUrl: 'assets/images/food3.jpg',
      name: 'BREAKFAST',
    ),
  ];

  List<Meal> get meals {
    return [..._meals];
  }
}

class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  Meal({
    @required this.id,
    @required this.imageUrl,
    @required this.description,
    @required this.name,
  });
}
