import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  WelcomePage({Key key, this.title}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffeaa448),
                  Color(0xffe46b10),
                  Color(0xffdd4400),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 15,
                ),
                _extraTitle(),
                SizedBox(
                  height: 80,
                ),
                _loginButton(),
                SizedBox(
                  height: 20,
                ),
                _signUpButton(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginPage(isLogin: true))),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xffdf8e33).withAlpha(100),
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xfff7892b),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Text(
          'Register now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Dr.",
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: "Hunger",
            style: TextStyle(
              color: Colors.white,
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
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
