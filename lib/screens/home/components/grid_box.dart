import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  const GridBox({Key? key, required this.title, required this.screen})
      : super(key: key);

  final String title;
  final StatefulWidget screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).primaryColor,
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
