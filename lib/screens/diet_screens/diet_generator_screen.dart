import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/food_type.dart';
import '../../widgets/bmi_components.dart';
import '../diet_screens/raw_materials.dart';

class DietGeneratorScreen extends StatefulWidget {
  DietGeneratorScreen({Key key}) : super(key: key);

  @override
  _DietGeneratorScreenState createState() => _DietGeneratorScreenState();
}

class _DietGeneratorScreenState extends State<DietGeneratorScreen> {
  List<int> meals = [1, 2, 3, 4, 5];
  List<String> diseases = [
    'Indigestion',
    'Diabetes',
    'Hypertension',
    'Heart disease',
    'Anemia',
  ];
  String _selectedDisease;
  bool _isAnythingSelected, _isvegSelected, _isMedSelected, _isPaleoSelected;
  int _numberOfMeals, _calories = 0;
  FocusNode _node = FocusNode();

  @override
  void initState() {
    _isAnythingSelected =
        _isvegSelected = _isMedSelected = _isPaleoSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffeaa448),
                  Color(0xffe46b10),
                  Color(0xffdd4400),
                ],
              ),
            ),
            child: DefaultTextStyle(
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'What type of food do you prefer?',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 350.0,
                          child: GridView(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                            ),
                            children: <Widget>[
                              FoodTypeCard(
                                image: 'assets/images/sandwich.png',
                                title: 'Anything',
                                isSelected: _isAnythingSelected,
                                onPress: () => setState(() =>
                                    _isAnythingSelected = !_isAnythingSelected),
                              ),
                              FoodTypeCard(
                                image: 'assets/images/diet.png',
                                title: 'Vegetarian',
                                isSelected: _isvegSelected,
                                onPress: () => setState(
                                    () => _isvegSelected = !_isvegSelected),
                              ),
                              FoodTypeCard(
                                image: 'assets/images/bruschetta.png',
                                title: 'Mediterranean',
                                isSelected: _isMedSelected,
                                onPress: () => setState(
                                    () => _isMedSelected = !_isMedSelected),
                              ),
                              FoodTypeCard(
                                image: 'assets/images/turkey.png',
                                title: 'Paleo',
                                isSelected: _isPaleoSelected,
                                onPress: () => setState(
                                    () => _isPaleoSelected = !_isPaleoSelected),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'How many calories do you need?',
                              style: TextStyle(fontSize: 19.0),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              onChanged: (value) => setState(() =>
                                  _calories = double.tryParse(value).round()),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.black45,
                                hintText: '1500 Calories',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Text(
                              'And how many meals?',
                              style: TextStyle(fontSize: 19.0),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 4.0,
                                ),
                                child: DropdownButton<int>(
                                  focusNode: _node,
                                  isExpanded: true,
                                  underline: SizedBox.shrink(),
                                  value: _numberOfMeals,
                                  dropdownColor: Colors.grey[900],
                                  onChanged: (value) {
                                    setState(() => _numberOfMeals = value);
                                    FocusScope.of(context).requestFocus(_node);
                                  },
                                  items: meals.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Center(
                                        child: Text('$value'),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'What is your condition?',
                              style: TextStyle(fontSize: 19.0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
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
                                  value: _selectedDisease,
                                  dropdownColor: Colors.grey[900],
                                  onChanged: (value) {
                                    setState(() => _selectedDisease = value);
                                    FocusScope.of(context).requestFocus(_node);
                                  },
                                  items: diseases.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(value),
                                      ),
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
                  BottomButton(
                    onTap: () async {
                      var currentUser =
                          await FirebaseAuth.instance.currentUser();
                      await Firestore.instance
                          .collection('Users')
                          .document(currentUser.uid)
                          .setData({
                        'Anything': _isAnythingSelected,
                        'Mediterranean': _isMedSelected,
                        'Vegetarian': _isvegSelected,
                        'Paleo': _isPaleoSelected,
                        'Calories': _calories,
                        'Number of Meals': _numberOfMeals,
                        'Disease': _selectedDisease,
                      }, merge: true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RawMaterials()));
                    },
                    buttonTitle: 'Continue',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
