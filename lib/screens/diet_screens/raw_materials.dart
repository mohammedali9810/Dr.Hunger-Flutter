import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../widgets/bmi_components.dart';
import '../../widgets/ingredient_row.dart';
import '../meal_screens/meal_overview.dart';

class RawMaterials extends StatefulWidget {
  @override
  _RawMaterialsState createState() => _RawMaterialsState();
}

class _RawMaterialsState extends State<RawMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Divider(
                        color: Colors.black,
                        height: 4,
                        thickness: 2,
                      ),
                    ),
                    IngredientRow(),
                    IngredientRow(),
                    IngredientRow(),
                    IngredientRow(),
                    IngredientRow(),
                    IngredientRow(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Divider(
                        color: Colors.black,
                        height: 4,
                        thickness: 2,
                      ),
                    ),
                    IngredientRow(isFruit: true),
                    IngredientRow(isFruit: true),
                    IngredientRow(isFruit: true),
                    IngredientRow(isFruit: true),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MealOverView())),
              buttonTitle: 'Generate',
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: InkWell(
            //     onTap: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MealOverView())),
            //     child: Container(
            //       padding: EdgeInsets.symmetric(horizontal: 155.0, vertical: 15),
            //       color: Color(0xfff7892b),
            //       child: Text(
            //         'Generate',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 19,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xfff7892b),
      //   elevation: 0.0,
      //   child: Padding(
      //     padding: EdgeInsets.only(right: 30.0, left: 30.0, bottom: 6),
      //     child: FlatButton(
      //       padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      //       color: Color(0xfff7892b),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8.0),
      //       ),
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => MealOverView()));
      //       },
      //       child: Text(
      //         'Generate',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 19,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
