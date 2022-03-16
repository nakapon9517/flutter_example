import 'package:example/constants.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({Key? key, required this.title, required this.screen})
      : super(key: key);

  final String title;
  final StatefulWidget screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: appBackgroundColor,
        onPrimary: appPrimaryColor,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<StatefulWidget>(
              builder: (context) => screen as StatefulWidget),
        );
      },
    );
  }
}
