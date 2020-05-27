import 'package:flutter/material.dart';
import 'package:work_space/widgets/meal_widgets/meal_item_detail_widget.dart';

class MealDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  MealDetailScreen({
    @required this.imageUrl,
    @required this.description,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MealItemDetail(
          imageUrl: imageUrl,
          title: title,
          description: description,
        ),
      ),
    );
  }
}
