import 'package:flutter/cupertino.dart';

class Meal with ChangeNotifier {
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
