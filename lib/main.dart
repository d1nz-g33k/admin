import 'package:admin/lock_screen.dart';
import 'package:admin/theme/dark_theme.dart';
import 'package:admin/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin',
      theme: CustomTheme.DarkTheme,
      // darkTheme:
      home: const LockScreen(),
    );
  }
}
