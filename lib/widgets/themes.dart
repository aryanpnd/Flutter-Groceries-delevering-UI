import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Color(0xfff6f4f4),
      canvasColor: Color(0xffeaeaea),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        headline5: TextStyle(
            color: Colors.black45, fontWeight: FontWeight.w100, fontSize: 20),
        headline4: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 23),
        subtitle2: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: Color(0xff0A2647),
      canvasColor: Color(0xff144272),
      fontFamily: GoogleFonts.poppins().fontFamily,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(

        headline6: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        headline5: TextStyle(
            color: Colors.white70, fontWeight: FontWeight.w100, fontSize: 20),
        headline4: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 23),
        headline3: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        subtitle1: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
      appBarTheme: AppBarTheme(
          color: Color(0xff144272),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.headline6));
}
