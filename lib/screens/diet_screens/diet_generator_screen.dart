import 'package:flutter/material.dart';
import 'package:work_space/screens/meal_screens/meal_overrview.dart';

import 'package:work_space/widgets/food-type.dart';

class DietGeneratorScreen extends StatefulWidget {
  DietGeneratorScreen({Key key}) : super(key: key);

  @override
  _DietGeneratorScreenState createState() => _DietGeneratorScreenState();
}

class _DietGeneratorScreenState extends State<DietGeneratorScreen> {
  List<String> meals = ['1 meal', '2 meals', '3 meals', '4 meals'];
  List<String> diseases = ['indigestion', 'diabetes', 'hypertension','heart disease'];

  String selectedDisease = 'indigestion';
  String selectedMealNumber = '4 meals';

  bool _isAnythingSelected = false;
  bool _isvegSelected = false;
  bool _isMedSelected = false;
  bool _isPaleoSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            top: 11.0,
            left: 30.0,
            right: 30.0,
            bottom: 20.0,
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Have any perfered?',
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 300.0,
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                      ),
                      children: <Widget>[
                        FoodTypeCard(
                          image: 'assets/images/sandwich.png',
                          title: 'Anything',
                          isSelected: _isAnythingSelected,
                          onPress: () {
                            setState(() {
                              _isAnythingSelected = !_isAnythingSelected;
                            });
                          },
                        ),
                        FoodTypeCard(
                          image: 'assets/images/diet.png',
                          title: 'Vegetarian',
                          isSelected: _isvegSelected,
                          onPress: () {
                            setState(() {
                              _isvegSelected = !_isvegSelected;
                            });
                          },
                        ),
                        FoodTypeCard(
                          image: 'assets/images/bruschetta.png',
                          title: 'Meditarranean',
                          isSelected: _isMedSelected,
                          onPress: () {
                            setState(() {
                              _isMedSelected = !_isMedSelected;
                            });
                          },
                        ),
                        FoodTypeCard(
                          image: 'assets/images/turkey.png',
                          title: 'Paleo',
                          isSelected: _isPaleoSelected,
                          onPress: () {
                            setState(() {
                              _isPaleoSelected = !_isPaleoSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'I want to eat',
                        style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 0.0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: '1500 Calories',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          suffixText: 'Not sure?',
                          suffixStyle: TextStyle(
                            color: Color(0xFF83D6C1),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'in how many meals?',
                        style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            value: selectedMealNumber,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedMealNumber = value;
                              });
                            },
                            items: meals.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('I Suffer Form', style: TextStyle(
                        color: Colors.blueGrey[800],
                        fontSize: 19.0,
                        fontWeight: FontWeight.w600,)),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            value: selectedDisease,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedDisease = value;
                              });
                            },
                            items: diseases.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Padding(
            padding: EdgeInsets.only(right: 30.0, left: 30.0, bottom: 20.0),
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              color: Color(0xfff7892b),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> MealOverView()));
              },
              child: Text(
                'Generate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//      appBar: AppBar(
//        brightness: Brightness.light,
//        elevation: 0.0,
//        backgroundColor: Colors.white,
//        automaticallyImplyLeading: false,
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 8.0),
//              child: Row(
//                children: <Widget>[
//                  CircleAvatar(
//                    radius: 22.0,
//                    backgroundColor: Colors.transparent,
//                    backgroundImage: AssetImage(
//                      'assets/images/profile.png',
//                    ),
//                  ),
//                  SizedBox(
//                    width: 5.0,
//                  ),
//                  Text(
//                    'Hi Samaka !',
//                    style: TextStyle(
//                      color: Colors.blueGrey[800],
//                      fontSize: 21.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            IconButton(
//              onPressed: () {},
//              icon: Icon(
//                Icons.search,
//                color: Colors.blueGrey[800],
//                size: 25.0,
//              ),
//            )
//          ],
//        ),
//      ),