import 'package:flutter/material.dart';

class AppTheme {

    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      // Add more text styles as needed
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blueGrey, // Replace with your app's primary color for dark mode
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey, // Replace with your app's primary color for dark mode
      onPrimary: Colors.white,
      onBackground: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      // Add more text styles as needed
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white54),
      ),
    ),
  );
}
