import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        background: Colors.grey.shade100,
        onPrimary: Colors.black,
      ),
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonTheme: ButtonThemeData(
      colorScheme: const ColorScheme.dark().copyWith(
        background: Colors.white10,
        onPrimary: Colors.white,
      ),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
