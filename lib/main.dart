import 'package:DrHunger/screens/bmi_screens/input_page.dart';
import 'package:DrHunger/screens/login_page.dart';
import 'package:DrHunger/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'providers/meals_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Meals()),
      ],
      child: Consumer<Auth>(
        builder: (context,auth,_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter ',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xffe46b10),
              textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
                bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
              ),
          ),
          home: auth.isAuth ? InputPage() : FutureBuilder(
            future: auth.tryAutoLohIn(),
            builder: (context,snapshot) => snapshot.connectionState == ConnectionState.waiting ? SplashScreen() : LoginPage(),
          ),
        ),
      ),
    );
  }
}