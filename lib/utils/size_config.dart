import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  late BuildContext context;
  late MediaQueryData query;

  SizeConfig(BuildContext context) {
    context = context;
    query = MediaQuery.of(context);
  }

  double width() => query.size.width;
  double height() => query.size.height;
}
