import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'login_page.dart';
// import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Icon(
                Icons.fastfood,
                size: 80,
                color: Colors.white,
              ),
              Shimmer.fromColors(
                child: Text(
                  "Dr.Hunger",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Pacifico",
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 20,
                        color: Colors.black45,
                        offset: Offset.fromDirection(120, 12),
                      )
                    ],
                  ),
                ),
                baseColor: Colors.amber,
                highlightColor: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "AI meal Planner",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 100),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
