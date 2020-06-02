import 'package:DrHunger/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/bmi_screens/input_page.dart';

String email;
String password;
String name;

Widget title(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: "Dr.",
      style: GoogleFonts.portLligatSans(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 30,
        color: Color(0xffe46b10),
        fontWeight: FontWeight.bold,
      ),
      children: <TextSpan>[
        TextSpan(
          text: "Hunger",
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget entryField(
    {@required String title,
    String hintText,
    Icon icon,
    bool isPassword = false,
    @required Function saveValue}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 3,
    ),
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
          child: TextField(
            onChanged: saveValue,
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

Widget submitButton(BuildContext context, bool isLogin) {
  Future<void> saveLogData() async {

    FireAuth  auth = FireAuth();

    if (isLogin)
      await auth.logIn(email, password);
    else
      await auth.signUp(email, password);
  }

  return InkWell(
    onTap: () async {
      await saveLogData();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InputPage()));
    },
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
          colors: <Color>[
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
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

Widget facebookButton() {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
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
                topLeft: Radius.circular(5),
              ),
            ),
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
            decoration: BoxDecoration(
              color: Color(0xff2872ba),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
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
  );
}

Widget gmailButton() {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
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
                topLeft: Radius.circular(5),
              ),
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
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
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
          onTap: () => callback(),
          child: Text(
            isLogin ? 'Register' : 'Login',
            style: TextStyle(
              color: Color(0xfff79c4f),
              fontSize: 13,
            ),
          ),
        ),
      ],
    ),
  );
}
