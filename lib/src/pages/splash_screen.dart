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
<<<<<<< Updated upstream:lib/src/pages/splash_screen.dart
  // @override
  // void initState() {
  //   super.initState();
  //   _mockCheckforSession().then((status){
  //     if (status){
  //       _navigateToHomeScreen();
  //     }
  //     else()
  //   });
  // }
  // Future<bool> _mockCheckforSession() async {
  //   await Future.delayed(Duration(seconds: 3), () {});
  //   return true;
  // }

  // void _navigateToSignningScreen() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context) => SiginingScreen()),
  //   );
  // }

  // void _navigateToHomeScreen() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context) => HomeScreen()),
  //   );
  // }
||||||| merged common ancestors:lib/screens/splash_screen.dart

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then((value) => Navigator.push(context, MaterialPageRoute(builder:(context){
      return LoginPage();
    } )));
  }
=======
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        })));
  }
>>>>>>> Stashed changes:lib/screens/splash_screen.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 140,
            ),
            Icon(
              Icons.fastfood,
              size: 80,
              color: Color(0xffe46b10),
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
                highlightColor: Colors.red),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "AI meal Planner",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Divider(
                height: 1,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 100,
            ),
<<<<<<< Updated upstream:lib/src/pages/splash_screen.dart
          ),
          SizedBox(
            height: 200,
          ),
          CircularProgressIndicator(),
        ],
||||||| merged common ancestors:lib/screens/splash_screen.dart
          ),
          SizedBox(
            height: 100,
          ),
          CircularProgressIndicator(),
        ],
=======
            CircularProgressIndicator(),
          ],
        ),
>>>>>>> Stashed changes:lib/screens/splash_screen.dart
      ),
    );
  }
}
