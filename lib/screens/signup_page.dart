import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bezierContainer.dart';
import 'login_page.dart';

class SignUppage extends StatefulWidget {
  SignUppage({Key key}) : super(key: key);

  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              Text(
                "Back",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _entryField(
      {@required String title,
      String hintText,
      Icon icon,
      bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: icon,
              fillColor: Color(0xfff3f3f4),
              filled: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Color(0xfffbb448), Color(0xfff7892b)]),
        ),
        child: Text(
          "Register Now",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
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
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: "Hunger",
              style: TextStyle(color: Colors.black, fontSize: 30),
            )
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(
            title: "Username",
            icon: Icon(Icons.person_outline),
            hintText: "Please enter your name"),
        _entryField(
            title: "Email id",
            icon: Icon(Icons.email),
            hintText: "Please eneter your E-mail"),
        _entryField(
          title: "Password",
          icon: Icon(Icons.security),
          hintText: "Please eneter your Password",
          isPassword: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Positioned(top: 40, left: 0, child: _backButton()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                    _title(),
                    SizedBox(
                      height: 130,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _loginAccountLabel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
