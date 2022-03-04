import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String input = '12';
  final items = List<String>.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(hintText: 'Input here'),
                      onChanged: (text) {
                        setState(() {
                          input = (text);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(input),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...items
                              .map((String val) => Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.pink[200],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    val,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 24,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.black12),
                                  )))
                              .toList()
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
