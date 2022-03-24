import 'package:flutter/material.dart';

class AppRouter {
  AppRouter(this.context);
  BuildContext context;

  void push(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute<StatelessWidget>(builder: (context) => widget),
    );
  }
}
