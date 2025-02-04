import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/ingredients_provider.dart';
import '../../widgets/bmi_components.dart';
import '../../widgets/ingredient_input.dart';
import '../meal_screens/meal_overview_screen.dart';

class RawMaterials extends StatefulWidget {
  @override
  _RawMaterialsState createState() => _RawMaterialsState();
}

class _RawMaterialsState extends State<RawMaterials> {
  Ingredients ingredients;
  GlobalKey<AnimatedListState> vegKey = GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> fruitKey = GlobalKey<AnimatedListState>();
  int vegCount = 3, fruitCount = 3;

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
        title: Text('What\'s in your kitchen?'),
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
        child: ListView(
          children: <Widget>[
            Center(
              heightFactor: 2,
              child: Text(
                'VEGETABLES',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Divider(
                color: Colors.black,
                height: 4,
                thickness: 2,
              ),
            ),
            _inputList(false),
            _addButton(false),
            Center(
              heightFactor: 2,
              child: Text(
                'FRUITS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Divider(
                color: Colors.black,
                height: 4,
                thickness: 2,
              ),
            ),
            _inputList(true),
            _addButton(true),
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
                    builder: (context) => MealOverview(),
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

  Widget _inputList(bool isFruit) {
    return AnimatedList(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      key: isFruit ? fruitKey : vegKey,
      initialItemCount: 3,
      itemBuilder: (context, index, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: IngredientInput(isFruit: isFruit),
          ),
        ),
      ),
    );
  }

  Widget _addButton(bool isFruit) {
    Duration duration = Duration(milliseconds: 500);
    return Center(
      heightFactor: 2,
      child: RaisedButton(
        elevation: 5,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add),
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        onPressed: () => setState(() {
          if (isFruit && ingredients.fruits.length > fruitCount)
            fruitKey.currentState.insertItem(fruitCount++, duration: duration);
          if (!isFruit && ingredients.vegetables.length > vegCount)
            vegKey.currentState.insertItem(vegCount++, duration: duration);
        }),
      ),
    );
  }
}
