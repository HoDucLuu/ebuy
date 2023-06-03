import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  //nut button
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      textStyle: const TextStyle(color: Colors.red),
      side: const BorderSide(color: Colors.red, width: 2),
      disabledForegroundColor: Colors.red.withOpacity(0.38),
    ),
  ),
  //theme input
  inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder),

  //theme button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 18.0,
      ),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
);

OutlineInputBorder outlineInputBorder =
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
