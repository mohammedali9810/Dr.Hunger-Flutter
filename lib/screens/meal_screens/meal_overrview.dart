import 'package:flutter/material.dart';
import 'package:work_space/widgets/meal_widgets/meal_grid.dart';

class MealOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Meals',),
        ),
        body: MealGrid(),
      ),
    );
  }
}
