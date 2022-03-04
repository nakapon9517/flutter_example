import 'package:example/next_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> indexs = List.generate(120, (int index) => index.toString());

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + "a"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('次へ'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NextPage(
                              title: '',
                            )),
                  );
                },
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Image(
                color: Colors.black87,
                colorBlendMode: BlendMode.screen,
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
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
                  ...indexs
                      .map((String index) => Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.pink[200],
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all((4)),
                          child: Text(
                            index + '-' + _counter.toString(),
                            // style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                // backgroundColor: Colors.black12,
                                color: Colors.black87,
                                fontSize: 24,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black12),
                          )))
                      .toList()
                ],
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
