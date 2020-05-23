import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/pages/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color(0xffe46b10),
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
            )),
        home: WelcomePage());
  }
}
