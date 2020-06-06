import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/meals_provider.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Meals()),
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
          appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.quicksandTextTheme(textTheme).apply(
              bodyColor: Colors.white,
            ),
          ),
        ),
        home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffeaa448),
                Color(0xffe46b10),
                Color(0xffdd4400),
              ],
            ),
          ),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
