import 'package:example/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyThemeRiverpod extends StateNotifier<ThemeData> {
  MyThemeRiverpod() : super(light);

  void toggle() {
    state = (state == light) ? dark : light;
  }
}

// class MyTheme extends ChangeNotifier {
//   ThemeData current = light;
//   bool _isDark = false;

//   void toggle() {
//     _isDark = !_isDark;
//     current = _isDark ? dark : light;
//     notifyListeners();
//   }
// }
