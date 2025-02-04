import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/bmi_screens/input_page.dart';
import '../services/auth.dart';
import '../style.dart';

String email;
String name;
String password;

Widget divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget emailPasswordWidget(bool isLogin) {
  return Column(
    children: <Widget>[
      if (!isLogin)
        entryField(
          title: "Username",
          icon: Icon(Icons.person_outline),
          hintText: "Please enter your name",
          saveValue: (value) => name = value,
        ),
      entryField(
          title: "Email",
          isEmail: true,
          hintText: "Please enter your E-mail",
          icon: Icon(Icons.email),
          saveValue: (value) => email = value),
      entryField(
          title: "Password",
          isPassword: true,
          hintText: "Please enter your password",
          icon: Icon(Icons.security),
          saveValue: (value) => password = value),
    ],
  );
}

Widget entryField(
    {@required String title,
    String hintText,
    Icon icon,
    bool isPassword = false,
    bool isEmail = false,
    @required Function saveValue}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Opacity(
          opacity: 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              onChanged: saveValue,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              obscureText: isPassword,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                icon: icon,
                fillColor: Color(0xfff3f3f4),
                filled: true,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget facebookButton() {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xff1959a9),
              alignment: Alignment.center,
              child: Text(
                'f',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Color(0xff2872ba),
              alignment: Alignment.center,
              child: Text(
                'Login with Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gmailButton() {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                border: Border.all(color: Colors.red, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                'G',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                'Login with Gmail',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget submitButton(BuildContext context, bool isLogin) {
  Future<void> saveLogData() async {
    FireAuth auth = FireAuth();
    if (isLogin)
      await auth.logIn(email, password);
    else {
      await auth.signUp(email, password);
      var currentUser = await FirebaseAuth.instance.currentUser();
      await Firestore.instance
          .collection('Users_Info')
          .document(currentUser.uid)
          .setData({
        'name': name,
        'email': email,
        'password': password,
      });
    }
  }

  return InkWell(
    onTap: () async {
      await saveLogData();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InputPage()));
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            secondaryColor,
            primaryColor,
          ],
        ),
      ),
      child: Text(
        isLogin ? 'Login' : 'Register Now',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget switchModeLabel(Function callback, bool isLogin) {
  return Container(
    key: ValueKey(isLogin),
    margin: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.bottomCenter,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          isLogin ? 'Don\'t have an account?' : 'Already have an account?',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: callback,
          child: BorderedText(
            strokeColor: backgroundColor,
            strokeWidth: 1.5,
            child: Text(
              isLogin ? 'Register' : 'Login',
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget title(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Dr. ',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 30,
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      BorderedText(
        strokeColor: backgroundColor,
        strokeWidth: 3,
        child: Text(
          'Hunger',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            color: secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
