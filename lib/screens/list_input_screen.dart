import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputListScreen extends StatefulWidget {
  const InputListScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _InputListScreen();
}

class _InputListScreen extends State<InputListScreen> {
  int _counter = 0;
  String input = '12';
  final items = List<String>.generate(100, (index) => index.toString());

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                          margin: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Column(children: [
                            const Text('change floating button press',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                )),
                            Text(
                              _counter.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                            )
                          ])),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Column(children: [
                            const Text('input here',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration:
                                        const InputDecoration(hintText: 'here'),
                                    onChanged: (text) {
                                      setState(() {
                                        input = (text);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(input),
                                ),
                              ],
                            ),
                          ])),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('list view',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                )),
                            ...items
                                .map((val) => Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      val,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 24,
                                          decorationColor: Colors.black12),
                                    )))
                                .toList()
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
