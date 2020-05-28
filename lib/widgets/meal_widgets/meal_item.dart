import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_space/providers/meal_provider.dart';
import 'package:work_space/screens/meal_screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(context, listen: false);
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailScreen(
        imageUrl: meal.imageUrl,
        description: meal.description,
        title: meal.name,
      )),),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 25,
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BREAKFAST',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Enjoy With Your Time',style: TextStyle(fontFamily: 'Pacifico',color: Colors.grey.shade800),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
