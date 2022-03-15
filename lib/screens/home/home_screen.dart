import 'package:example/components/app_drawer.dart';
import 'package:example/constants.dart';
import 'package:example/screens/home/widgets/bottom_sheet.dart';
import 'package:example/screens/home/widgets/card_button.dart';
import 'package:example/screens/home/widgets/carousel.dart';
import 'package:example/screens/list_input_screen.dart';
import 'package:example/screens/local_storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  ];

  final double height = 240;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            backgroundColor: appPrimaryColor,
            expandedHeight: height,
            flexibleSpace: FlexibleSpaceBar(
              background: Carousel(
                height: height + 80,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 6 / 5,
              children: List.generate(
                screens.length,
                (index) => (CardButton(
                  index: index,
                  title: screens[index].title,
                  screen: screens[index].screen,
                )),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: defaultPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ElevatedButton(
                    child: const Text(
                      'Bottom sheet',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: appPrimaryColor,
                      onPrimary: appPrimaryColor,
                    ),
                    onPressed: () {
                      showModalBottomSheet<Widget>(
                        context: context,
                        builder: (context) {
                          return const BottomSheetModal();
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'GitHub',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: appPrimaryColor,
                      onPrimary: appPrimaryColor,
                    ),
                    onPressed: () {
                      _launchURL('https://github.com/nakapon9517');
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'pub.dev',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: appPrimaryColor,
                      onPrimary: appPrimaryColor,
                    ),
                    onPressed: () {
                      _launchURL('https://pub.dev/');
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Flutter公式',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: appPrimaryColor,
                      onPrimary: appPrimaryColor,
                    ),
                    onPressed: () {
                      _launchURL('https://flutter.dev');
                    },
                  ),
                ],
              ),
            ),
          )
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
