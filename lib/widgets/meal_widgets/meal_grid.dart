import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_space/providers/meals_provider.dart';

import 'meal_item.dart';


class MealGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: meals.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: meals[index],
          child: MealItem(
          )
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
//        crossAxisCount: (MediaQuery.of(context).size.width > 350)? 2 : 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 2,
        childAspectRatio: 3/2,
      ),
    );
  }
}
