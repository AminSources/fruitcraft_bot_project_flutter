import 'package:flutter/material.dart';

class AppTheme {
  //* light theme
  ThemeData lightTheme = ThemeData(
    fontFamily: "quadonSoltan",

    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

    //* text fields theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2.0),
      ),
    ),

    //* elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade400,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  );
}
