import 'package:flutter/material.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({Key? key}) : super(key: key);
  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreen();
}

class _LocalStorageScreen extends State<LocalStorageScreen> {
  double _slideValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider / Local storage'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.green[50],
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(children: [
                    Text('count:' + _slideValue.toString(),
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 18)),
                    Slider(
                      value: _slideValue,
                      max: 100,
                      divisions: 5,
                      label: _slideValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _slideValue = value;
                        });
                      },
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
