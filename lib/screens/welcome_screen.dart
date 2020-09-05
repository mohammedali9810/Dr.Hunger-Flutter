import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _container(true),
            _container(false),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _title(),
                  SizedBox(
                    height: 15,
                  ),
                  _extraTitle(),
                  SizedBox(
                    height: 50,
                  ),
                  _loginButton(true),
                  SizedBox(
                    height: 15,
                  ),
                  _loginButton(false),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Dr. ",
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
        children: [
          TextSpan(
            text: "Hunger",
            style: TextStyle(
              color: secondaryColor,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraTitle() {
    return Text(
      "AI Meal & recipe Planner",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  Widget _loginButton(bool isLogin) {
    return RaisedButton(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginPage(isLogin: isLogin))),
      padding: EdgeInsets.symmetric(vertical: 18),
      color: isLogin ? secondaryColor : primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          isLogin ? 'Login' : 'Register Now',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _container(bool top) {
    Rect rect = top
        ? Rect.fromLTWH(-55.4, -56.1, 434.0, 176.0)
        : Rect.fromLTWH(-18.6, 610.3, 434.0, 176.0);
    return Pinned.fromSize(
      bounds: rect,
      size: Size(360.0, 720.0),
      pinTop: top,
      pinLeft: true,
      pinRight: true,
      pinBottom: !top,
      fixedHeight: true,
      child: Transform.rotate(
        angle: 0.1745,
        child: Container(
          decoration: BoxDecoration(
            color: top ? primaryColor : secondaryColor,
          ),
        ),
      ),
    );
  }
}
