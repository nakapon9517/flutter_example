import 'package:flutter/material.dart';

const appPrimaryColor = Color(0xFF607B8B);
// const appPrimaryColor = Colors.blueGrey;
const appTextColor = Color(0xFF424242);
const appBackgroundColor = Colors.white;

const double defaultPadding = 12;

const _lightTextColor = Color(0xFFE9F7F9);

const _lightPrimary = Color(0xFF607B8B);
const _lightBackground = Color(0xFFE9F7F9);

final ThemeData light = ThemeData.light().copyWith(
  primaryColor: _lightPrimary,
  appBarTheme: const AppBarTheme(
    backgroundColor: _lightPrimary,
  ),
  backgroundColor: _lightBackground,
  scaffoldBackgroundColor: _lightBackground,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF122442),
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Color(0xFF122442),
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color(0xFF122442),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: Colors.amber[600],
    unselectedItemColor: _lightPrimary.withOpacity(0.6),
    backgroundColor: _lightBackground,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
      primary: _lightPrimary,
      onPrimary: _lightPrimary,
    ),
  ),
);

const _darkPrimary = Color(0xFF122442);
const _darkBackground = Color(0xFF040A14);

final ThemeData dark = ThemeData.dark().copyWith(
  primaryColor: _darkPrimary,
  appBarTheme: const AppBarTheme(
    backgroundColor: _darkPrimary,
  ),
  backgroundColor: _darkBackground,
  scaffoldBackgroundColor: _darkBackground,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: _lightTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: _lightTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: _lightTextColor,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
    selectedItemColor: Colors.amber[800],
    unselectedItemColor: _lightTextColor.withOpacity(0.6),
    backgroundColor: _darkBackground,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
      primary: _darkPrimary,
      onPrimary: _darkPrimary,
    ),
  ),
);
