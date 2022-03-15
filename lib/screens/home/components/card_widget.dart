import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.title, required this.screen})
      : super(key: key);

  final String title;
  final StatefulWidget screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<StatefulWidget>(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
