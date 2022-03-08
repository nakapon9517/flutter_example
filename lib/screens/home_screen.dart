import 'package:example/components/app_drawer.dart';
import 'package:example/screens/carousel_screen.dart';
import 'package:example/screens/list_input_screen.dart';
import 'package:example/screens/local_storage_screen.dart';
import 'package:example/screens/url_launcher_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> indexs = List.generate(120, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: double.infinity,
              child: Builder(
                builder: (context) {
                  return Image.asset(
                    "images/horizon.png",
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Input / List',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatefulWidget>(
                      builder: (context) => const InputListScreen(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Slider / Local Storage',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatefulWidget>(
                        builder: (context) => const LocalStorageScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Carousel',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatefulWidget>(
                        builder: (context) => const CarouselScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Open browser',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatefulWidget>(
                      builder: (context) => const UrlLauncherScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'Bottom sheet（modal）',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatefulWidget>(
                      builder: (context) => const BottomSheetScreen(),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
