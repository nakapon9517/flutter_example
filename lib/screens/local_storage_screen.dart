import 'package:flutter/material.dart';

import '../repositories/local_storage.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({Key? key}) : super(key: key);
  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreen();
}

enum Storage { slideValue }

class _LocalStorageScreen extends State<LocalStorageScreen> {
  final _localStorage = LocalStorageRepository<double>();
  double _slideValue = 0;
  String slideKey = Storage.slideValue.toString();

  @override
  void initState() {
    super.initState();
    _localStorage.getAll(slideKey).then(
          (value) => {
            setState(
              () {
                _slideValue = (value ?? 0);
              },
            )
          },
        );
  }

  Future<void> onChangeSlide(double value) async {
    await _localStorage.save(slideKey, value);
    setState(() {
      _slideValue = value;
    });
  }

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
                      onChanged: onChangeSlide,
                    )
                  ]),
                ),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      child: const Text('Remove'),
                      onPressed: () {
                        _localStorage.remove(slideKey);
                      },
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
