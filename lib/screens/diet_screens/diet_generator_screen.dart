import 'package:flutter/material.dart';
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
  List<String> meals = ['1 meal', '2 meals', '3 meals', '4 meals'];
  List<String> diseases = [
    'indigestion',
    'diabetes',
    'hypertension',
    'heart disease'
  ];
  String selectedDisease = 'indigestion';
  String selectedMealNumber = '4 meals';
  bool _isAnythingSelected = false;
  bool _isvegSelected = false;
  bool _isMedSelected = false;
  bool _isPaleoSelected = false;
  FocusNode _node = FocusNode();

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
            padding: EdgeInsets.only(top: 10),
            child: DefaultTextStyle(
              style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 30),
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
                              // physics: NeverScrollableScrollPhysics(),
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
                                      _isAnythingSelected =
                                          !_isAnythingSelected),
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
                                  onPress: () => setState(() =>
                                      _isPaleoSelected = !_isPaleoSelected),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'I want to eat',
                                style: TextStyle(fontSize: 19.0),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                textAlign: TextAlign.center,
                                onEditingComplete: () =>
                                    FocusScope.of(context).requestFocus(_node),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.black45,
                                  hintText: '1500 Calories',
                                  hintStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Number of meals',
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
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: SizedBox.shrink(),
                                    value: selectedMealNumber,
                                    dropdownColor: Colors.grey[900],
                                    onChanged: (value) {
                                      setState(
                                          () => selectedMealNumber = value);
                                      FocusScope.of(context)
                                          .requestFocus(_node);
                                    },
                                    items: meals.map((String value) {
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
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'I suffer from',
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
                                    value: selectedDisease,
                                    dropdownColor: Colors.grey[900],
                                    onChanged: (value) {
                                      setState(() => selectedDisease = value);
                                      FocusScope.of(context)
                                          .requestFocus(_node);
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
                  ),
                  BottomButton(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RawMaterials())),
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
