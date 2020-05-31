import 'package:DrHunger/screens/meal_screens/meal_overview.dart';
import 'package:DrHunger/widgets/raw_materials/mainRawMaterials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RawMaterials extends StatefulWidget {
  @override
  _RawMaterialsState createState() => _RawMaterialsState();
}

class _RawMaterialsState extends State<RawMaterials> {
  String selectedVeg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Raw Materials You Own ..',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: MainRawMaterials(),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xfff7892b),
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.only(right: 30.0, left: 30.0, bottom: 6),
          child: FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            color: Color(0xfff7892b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MealOverView()));
            },
            child: Text(
              'Generate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
