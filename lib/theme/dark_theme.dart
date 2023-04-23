import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  var theme = {
    "light": {
      "primaryColor": const Color(0xFF4B39EF),
      "secondaryColor": const Color(0xFFFBAF7C),
      "tertiaryColor": const Color(0xFF39D2C0),
      "alternateColor": const Color(0xFFFFFFFF),
      "primaryTextColor": const Color(0xFF4B39EF),
      "secondaryTextColor": const Color(0xFF8B97A2),
      "primaryBackgroundColor": const Color(0xFFF1F4F8),
      "secondaryBackgroundColor": const Color(0xFFFFFFFF),
      "accent1": const Color(0xFF616161),
      "accent2": const Color(0xFF757575),
      "accent3": const Color(0xFFE0E0E0),
      "accent4": const Color(0xFFEEEEEE),
      "success": const Color(0xFF04A24C),
      "error": const Color(0xFFE21C3D),
      "warning": const Color(0xFFFCDC0C),
      "info": const Color(0xFF1C4494),
    },
    "dark":{
      "primaryColor": const Color(0xFF4B39EF),
      "secondaryColor": const Color(0xFFFBAF7C),
      "tertiaryColor": const Color(0xFF39D2C0),
      "alternateColor": const Color(0xFFFFFFFF),
      "primaryTextColor": const Color(0xFFFFFFFF),
      "secondaryTextColor": const Color(0xFF8B97A2),
      "primaryBackgroundColor": const Color(0xFF1A1F24),
      "secondaryBackgroundColor": const Color(0xFF111417),
      "accent1": const Color(0xFFEEEEEE),
      "accent2": const Color(0xFFE0E0E0),
      "accent3": const Color(0xFF757575),
      "accent4": const Color(0xFF616161),
      "success": const Color(0xFF04A24C),
      "error": const Color(0xFFE21C3D),
      "warning": const Color(0xFFFCDC0C),
      "info": const Color(0xFF1C4494),
    }
  };

  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get DarkTheme {
    return ThemeData(
      // Define the default brightness and colors.
      primaryColor: const Color(0xFF4B39EF),
      secondaryHeaderColor: const Color(0xFFFBAF7C),
      scaffoldBackgroundColor: const Color(0xFF1A1F24),
      dialogBackgroundColor: const Color(0xFF111417),
      // colorScheme: ColorScheme(brightness: Brightness.dark, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
      // primaryColor: const Color(0xFF4B39EF),
      // primaryColor: const Color(0xFF4B39EF),
      brightness: Brightness.dark,
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