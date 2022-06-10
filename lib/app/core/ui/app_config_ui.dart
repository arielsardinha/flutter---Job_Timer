import 'package:flutter/material.dart';

abstract class AppConfigUI {
  static const MaterialColor _materialColor = MaterialColor(
    0XFF0066B0,
    {
      50: Color(0XFF005c9e),
      100: Color(0XFF00528b),
      200: Color(0XFF00477b),
      300: Color(0XFF003d6a),
      400: Color(0XFF003358),
      500: Color(0XFF002946),
      600: Color(0XFF001f35),
      700: Color(0XFF001423),
      800: Color(0XFF000a12),
      900: Color(0XFF000000),
    },
  );

  static final ThemeData theme = ThemeData(
    // useMaterial3: true,
    primarySwatch: _materialColor,
    colorScheme: ColorScheme.fromSeed(seedColor: _materialColor),
    primaryColor: const Color(0xFF0066B0),
    primaryColorLight: const Color(0xFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
