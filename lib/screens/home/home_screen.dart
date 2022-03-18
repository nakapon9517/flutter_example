import 'package:example/components/app_drawer.dart';
import 'package:example/constants.dart';
import 'package:example/screens/chat_ui/chat_ui_screen.dart';
import 'package:example/screens/home/components/bottom_sheet.dart';
import 'package:example/screens/home/components/carousel.dart';
import 'package:example/screens/home/components/flex_box.dart';
import 'package:example/screens/home/components/grid_box.dart';
import 'package:example/screens/login/login_screen.dart';
import 'package:example/screens/slider/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repositories/local_storage_repository.dart';
import '../../utils/theme.dart';
import '../chat/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> indexs = List.generate(120, (index) => index.toString());
  final _localStorage = LocalStorageRepository<bool>();
  final _isDarkKey = Storage.isDark.toString();
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _localStorage
        .getAll(_isDarkKey)
        .then((value) => {_isDark = (value ?? false)});
  }

  List<Button> screens = [
    Button(
      'Login',
      const LoginScreen(
        title: 'Login',
      ),
    ),
    Button(
      'LocalStorage',
      const LocalStorageScreen(),
    ),
  ];

  final double height = 240;

  void _onChangeTheme(BuildContext context) {
    Provider.of<MyTheme>(context, listen: false).toggle();
  }

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
            expandedHeight: height,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Horizon'),
              background: Carousel(
                height: height + 80,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: defaultPadding,
              bottom: defaultPadding / 2,
              left: defaultPadding,
              right: defaultPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  FlexBox(
                    title: 'original_chat',
                    color: Colors.amber[600],
                    func: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<StatefulWidget>(
                            builder: (context) => const ChatScreen()),
                      );
                    },
                  ),
                  FlexBox(
                    title: 'flutter_chat_ui',
                    func: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<StatefulWidget>(
                            builder: (context) => const ChatUiScreen()),
                      );
                    },
                  ),
                  FlexBox(
                    title: 'change Dark mode',
                    color: ThemeData.dark().primaryColor,
                    func: () {
                      _onChangeTheme(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
            ),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 6 / 5,
              children: List.generate(
                screens.length,
                (index) => (GridBox(
                  title: screens[index].title,
                  screen: screens[index].screen,
                )),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  FlexBox(
                    title: 'Bottom Sheet',
                    func: () {
                      showModalBottomSheet<Widget>(
                        context: context,
                        builder: (context) {
                          return const BottomSheetModal();
                        },
                      );
                    },
                  ),
                  FlexBox(
                    title: 'GitHub',
                    func: () {
                      _launchURL('https://github.com/nakapon9517');
                    },
                  ),
                  FlexBox(
                    title: 'pub.dev',
                    func: () {
                      _launchURL('https://pub.dev/');
                    },
                  ),
                  FlexBox(
                    title: 'Flutter公式',
                    func: () {
                      _launchURL('https://flutter.dev');
                    },
                  ),
                ],
              ),
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
