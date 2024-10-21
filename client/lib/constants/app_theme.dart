import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue, // Replace with your app's primary color
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.blue, // Replace with your app's primary color
      onPrimary: Colors.white,
      onBackground: Colors.black,
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
