import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  MealDetailScreen({
    @required this.imageUrl,
    @required this.description,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xffe46b10),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // todo: wrap in a Hero widget
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Color(0xffe46b10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.bold,
                ),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Color(0xffe46b10),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'SHOW INGREDIENTS',
                    style: TextStyle(
                      color: Color(0xffe46b10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 12, left: 10),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Put all ingredients in one blender and give it 10 minutes before serving.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          fontFamily: 'Anton',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
