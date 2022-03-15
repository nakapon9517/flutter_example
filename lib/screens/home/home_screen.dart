import 'package:example/components/app_drawer.dart';
import 'package:example/constants.dart';
import 'package:example/screens/home/components/card_widget.dart';
import 'package:example/screens/home/components/carousel.dart';
import 'package:example/screens/list_input_screen.dart';
import 'package:example/screens/local_storage_screen.dart';
import 'package:example/screens/url_launcher_screen.dart';
import 'package:flutter/material.dart';

import '../bottom_sheet_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> indexs = List.generate(120, (index) => index.toString());

  List<Button> screens = [
    Button(
      'Input/List',
      const InputListScreen(
        title: 'Input/List',
      ),
    ),
    Button(
      'LocalStorage',
      const LocalStorageScreen(),
    ),
    Button(
      'UrlLauncher',
      const UrlLauncherScreen(),
    ),
    Button(
      'ButtonSheet',
      const BottomSheetScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(widget.title),
          backgroundColor: appPrimaryColor),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Carousel(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              children: List.generate(
                  screens.length,
                  (index) => (CardWidget(
                      title: screens[index].title,
                      screen: screens[index].screen))),
            ),
          ),
        ],
      ),
    );
  }
}

class Button {
  Button(this.title, this.screen);

  String title;
  StatefulWidget screen;
}
