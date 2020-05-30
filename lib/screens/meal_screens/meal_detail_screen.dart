import 'package:DrHunger/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.all(8),
                    width: 175,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
                      child: Image(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          description,
                          style: TextStyle(
                            color: Color(0xffe46b10),
                            fontSize: 14,
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
                            color: Colors.purple,
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
                      ],
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(10,-150),
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
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Calories',style: TextStyle(color: Colors.black,fontSize:14 ,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('Carbs',style: TextStyle(fontSize: 14,color: Colors.amber,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('Fat',style: TextStyle(fontSize: 14,color: Colors.purple,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('Protein',style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('Fiber',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: <Widget>[
                          Text('681',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('25g',style: TextStyle(fontSize: 14,color: Colors.amber,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('34g',style: TextStyle(fontSize: 14,color: Colors.purple,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('44g',style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text('10g',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('RECENT CALORIES FORM',style: TextStyle(fontFamily: 'Anton',fontSize: 14,fontWeight: FontWeight.bold),),
                      Chart(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: FlatButton(
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
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 12, left: 40),
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
                      padding:
                          const EdgeInsets.only(right: 30, top: 12, left: 10),
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
          ),
        ],
      ),
    );
  }
}
