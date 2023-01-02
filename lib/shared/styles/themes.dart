import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: mainColor,
  primarySwatch: swatchColor,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: mainColor,
    hintStyle: TextStyle(
      color: kColor1,
    ),
  ),
);


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: darkGreyColor,
  primaryColor: darkGreyColor,
  primarySwatch: darkSwatchColor,
  appBarTheme: const AppBarTheme(
    color: darkGreyColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: pinkColor,
    hintStyle: TextStyle(
      color: kColor2,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: pinkColor,
    ),
  ),
);