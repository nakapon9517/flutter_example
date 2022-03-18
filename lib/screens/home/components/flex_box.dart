import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class FlexBox extends StatelessWidget {
  FlexBox({
    Key? key,
    required this.title,
    required this.func,
    this.color,
  }) : super(key: key);

  String title;
  Function func;
  Color? color;

  @override
  Widget build(BuildContext context) {
    ButtonStyle style;
    if (color != null) {
      style = ElevatedButton.styleFrom(
        primary: color,
      );
    } else {
      style = ElevatedButton.styleFrom();
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultPadding / 2,
      ),
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: style,
        onPressed: () {
          func();
        },
      ),
    );
  }
}
