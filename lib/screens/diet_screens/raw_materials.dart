import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/ingredients_provider.dart';
import '../../widgets/bmi_components.dart';
import '../../widgets/ingredient_row.dart';
import '../meal_screens/meal_overview.dart';

class RawMaterials extends StatefulWidget {
  @override
  _RawMaterialsState createState() => _RawMaterialsState();
}

class _RawMaterialsState extends State<RawMaterials> {
  int _vegCount = 3, _fruitCount = 3;
  Ingredients ingredients;

  @override
  Widget build(BuildContext context) {
    ingredients = Provider.of(context);
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
          ],
        ),
        title: Text(
          'What\'s in your kitchen?',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffeaa448),
              Color(0xffe46b10),
              Color(0xffdd4400),
            ],
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'VEGETABLES',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        color: Colors.black,
                        height: 4,
                        thickness: 2,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _vegCount,
                      itemBuilder: (context, index) => IngredientRow(),
                    ),
                    _addButton(false),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FRUITS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        color: Colors.black,
                        height: 4,
                        thickness: 2,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _fruitCount,
                      itemBuilder: (context, index) =>
                          IngredientRow(isFruit: true),
                    ),
                    _addButton(true),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () async {
                var currentUser = await FirebaseAuth.instance.currentUser();
                await Firestore.instance
                    .collection('raw_materials')
                    .document(currentUser.uid)
                    .setData(ingredients.ingredients);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealOverView(),
                  ),
                );
              },
              buttonTitle: 'Generate',
            ),
          ],
        ),
      ),
    );
  }

  Widget _addButton(bool isFruit) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RaisedButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add_circle_outline),
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        onPressed: () => setState(() {
          if (isFruit && ingredients.fruits.length > _fruitCount) _fruitCount++;
          if (!isFruit && ingredients.vegetables.length > _vegCount)
            _vegCount++;
        }),
      ),
    );
  }
}
