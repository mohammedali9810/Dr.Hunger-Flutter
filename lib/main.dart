import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/ingredients_provider.dart';
import 'providers/meals_provider.dart';
import 'screens/bmi_screens/input_page.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Meals()),
        ChangeNotifierProvider(create: (context) => Ingredients()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Color(0xffe46b10),
          textTheme: GoogleFonts.quicksandTextTheme(textTheme).copyWith(
            subtitle1: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.quicksandTextTheme(textTheme).apply(
              bodyColor: Colors.white,
            ),
          ),
        ),
        home: InputPage(),
      ),
    );
  }
}
