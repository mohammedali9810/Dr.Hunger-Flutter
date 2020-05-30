import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffeaa448),
                    Color(0xffe46b10),
                    Color(0xffdd4400),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // todo: wrap in a Hero widget
                        Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 30,
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
                        color: Colors.white,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: PieChart(
                        dataMap: <String, double>{
                          'Carbs   ' + '44g': 44,
                          'Fat   ' + '35g': 35,
                          'Protein   ' + '29g': 29,
                          'Fiber   ' + '14g': 14,
                        },
                        animationDuration: Duration(milliseconds: 1500),
                        chartType: ChartType.ring,
                        chartValueBackgroundColor: Colors.white70,
                        colorList: <Color>[
                          Colors.green,
                          Colors.lightBlue,
                          Colors.indigo,
                          Colors.teal,
                        ],
                        initialAngle: pi,
                        legendPosition: LegendPosition.right,
                        legendStyle: TextStyle(color: Colors.white),
                        showChartValueLabel: true,
                      ),
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
                      padding: const EdgeInsets.all(30),
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
                    // SizedBox(
                    //   height: 50,
                    // )
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
