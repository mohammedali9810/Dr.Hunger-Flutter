import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bezierContainer.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: "Dr.",
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            color: Color(0xffe46b10),
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
                text: "Hunger",
                style: GoogleFonts.portLligatSans(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ))
          ]),
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
          Opacity(
            opacity: 0.75,
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                icon: icon,
                fillColor: Color(0xfff3f3f4),
                filled: true,
              ),
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
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(
            title: "Email",
            hintText: "Please enter your E-mail",
            icon: Icon(Icons.email)),
        _entryField(
            title: "Password",
            isPassword: true,
            hintText: "Please enter your password",
            icon: Icon(Icons.security)),
      ],
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Login with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gmailButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('G',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Login with Gmail',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUppage()));
            },
            child: Text(
              'Register',
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                _title(),
                SizedBox(
                  height: 35,
                ),
                _emailPasswordWidget(),
                SizedBox(
                  height: 15,
                ),
                _submitButton(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password ?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                _divider(),
                _facebookButton(),
                _gmailButton(),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _createAccountLabel(),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    )));
  }
}
