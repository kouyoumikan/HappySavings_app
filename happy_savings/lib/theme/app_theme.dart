import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData indigo() {
    return ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
    );
  }

  static ThemeData blue() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    );
  }

  static ThemeData green() {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
    );
  }

  static ThemeData orange() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      brightness: Brightness.light,
    );
  }

  static ThemeData brown() {
    return ThemeData(
      primarySwatch: Colors.brown,
      brightness: Brightness.light,
    );
  }

  static ThemeData red() {
    return ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light,
    );
  }

  static ThemeData pink() {
    return ThemeData(
      primarySwatch: softPink,
      brightness: Brightness.light,
    );
  }

  static ThemeData purple() {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
    );
  }

  static const int _pinkPrimaryValue = 0xFFF06292;
  static const MaterialColor softPink = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFFCE4EC),
      200: Color(0xFFFCE4EC),
      300: Color(0xFFF8BBD0),
      400: Color(0xFFF48FB1),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFEC407A),
      700: Color(0xFFE91E63),
      800: Color(0xFFD81B60),
      900: Color(0xFFC2185B),
    },
  );
}
