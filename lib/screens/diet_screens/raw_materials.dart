import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  FocusNode _node = new FocusNode();
  String selectedItem1,
      selectedItem2,
      selectedItem3,
      selectedItem4,
      selectedItem5,
      selectedItem6;
  String selectedFruit1, selectedFruit2, selectedFruit3, selectedFruit4;
  String vegNum1,vegNum2,vegNum3,vegNum4,vegNum5,vegNum6,fruitNum1,fruitNum2,fruitNum3,fruitNum4;

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
                    IngredientRow(
                      selectedItem: selectedItem1,
                      selectDataFun: (value) {
                        setState(() => selectedItem1 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum1 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      selectedItem: selectedItem2,
                      selectDataFun: (value) {
                        setState(() => selectedItem2 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum2 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      selectedItem: selectedItem3,
                      selectDataFun: (value) {
                        setState(() => selectedItem3 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum3 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      selectedItem: selectedItem4,
                      selectDataFun: (value) {
                        setState(() => selectedItem4 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum4 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      selectedItem: selectedItem5,
                      selectDataFun: (value) {
                        setState(() => selectedItem5 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum5 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      selectedItem: selectedItem6,
                      selectDataFun: (value) {
                        setState(() => selectedItem6 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          vegNum6 = value;
                        });
                      },
                    ),
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
                    IngredientRow(
                      isFruit: true,
                      selectedItem: selectedFruit1,
                      selectDataFun: (value) {
                        setState(() => selectedFruit1 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          fruitNum1 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      isFruit: true,
                      selectedItem: selectedFruit2,
                      selectDataFun: (value) {
                        setState(() => selectedFruit2 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          fruitNum2 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      isFruit: true,
                      selectedItem: selectedFruit3,
                      selectDataFun: (value) {
                        setState(() => selectedFruit3 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          fruitNum3 = value;
                        });
                      },
                    ),
                    IngredientRow(
                      isFruit: true,
                      selectedItem: selectedFruit4,
                      selectDataFun: (value) {
                        setState(() => selectedFruit4 = value);
                        FocusScope.of(context).requestFocus(_node);
                      },
                      numberFun: (value) {
                        setState(() {
                          fruitNum4 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap:  () async {
                 var currentUser = await FirebaseAuth.instance.currentUser();
                 await Firestore.instance.collection('raw_materials').document(currentUser.uid).setData({
                   '$selectedItem1' : vegNum1,
                   '$selectedItem2' : vegNum2,
                   '$selectedItem3' : vegNum3,
                   '$selectedItem4' : vegNum4,
                   '$selectedItem5' : vegNum5,
                   '$selectedItem6' : vegNum6,
                   '$selectedFruit1' : fruitNum1,
                   '$selectedFruit2' : fruitNum2,
                   '$selectedFruit3' : fruitNum3,
                   '$selectedFruit4' : fruitNum4
                 });

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
}
