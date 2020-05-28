import 'package:flutter/material.dart';
import 'package:work_space/screens/meal_screens/meal_overrview.dart';

class MealItemDetail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  MealItemDetail(
      {@required this.imageUrl,
      @required this.description,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealOverView()));
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70),
                    child: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer),
              Text(
                '10 Min',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'SHOW INGREDIENTS',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 12, left: 10),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Combine All Ingredients in One Blender And Leave it Take 10 minutes before Eat It.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      fontFamily: 'Anton'
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
