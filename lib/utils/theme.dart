import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  ThemeData current = _light;
  bool _isDark = false;

  void toggle() {
    _isDark = !_isDark;
    current = _isDark ? _dark : _light;
    notifyListeners();
  }
}

final ThemeData _light = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF607B8B),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF607B8B),
  ),
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
);

final ThemeData _dark = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF122442),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF122442),
  ),
  backgroundColor: const Color(0xFF040A14),
  scaffoldBackgroundColor: const Color(0xFF040A14),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: Color(0xFFE9F7F9),
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Color(0xFFE9F7F9),
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color(0xFFE9F7F9),
    ),
  ),
);
