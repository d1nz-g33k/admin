import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData get LightTheme {
    return ThemeData(
      // Define the default brightness and colors.
      primaryColor: const Color(0xFF4B39EF),
      secondaryHeaderColor: const Color(0xFFFBAF7C),
      scaffoldBackgroundColor: const Color(0xFFF1F4F8),
      // scaffoldBackgroundColor: const Color(0xFFF1F4F8),
      // primaryColor: const Color(0xFF4B39EF),
      // primaryColor: const Color(0xFF4B39EF),
      brightness: Brightness.light,
      // primaryColor: Colors.lightBlue[800],

      // Define the default font family.
      fontFamily: 'Georgia',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}