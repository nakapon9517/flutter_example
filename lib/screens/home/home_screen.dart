import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:example/components/app_drawer.dart';
import 'package:example/constants.dart';
import 'package:example/screens/chat_ui/chat_ui_screen.dart';
import 'package:example/screens/fiverpod/riverpod_screen.dart';
import 'package:example/screens/home/components/bottom_sheet.dart';
import 'package:example/screens/home/components/carousel.dart';
import 'package:example/screens/home/components/flex_box.dart';
import 'package:example/screens/home/components/grid_box.dart';
import 'package:example/screens/login/login_screen.dart';
import 'package:example/screens/slider/slider_screen.dart';
import 'package:example/utils/app_router.dart';
import 'package:example/utils/open_mailer.dart';
import 'package:example/utils/send_email.dart';
import 'package:example/utils/url_launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

import '../../repositories/local_storage_repository.dart';
import '../chat/chat_screen.dart';

final inputController = InputController();

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
    // Provider.of<MyTheme>(context, listen: false).toggle();
  }

  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    try {
      bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Please authenticate to show account balance');
      if (didAuthenticate) {
        Navigator.pop(context);
      }
    } on PlatformException catch (e) {
      switch (e.code) {
        case auth_error.lockedOut:
          print('lockdOut');
          break;
        case auth_error.notAvailable:
          print('notAvailable');
          break;
        case auth_error.notEnrolled:
          print('notEnrolled');
          break;
        case auth_error.otherOperatingSystem:
          print('otherOperatingSystem');
          break;
        case auth_error.passcodeNotSet:
          print('passcodeNotSet');
          break;
        case auth_error.permanentlyLockedOut:
          print('permanentlyLockedOut');
          break;
        default:
          print('othe error >>${e.message.toString()}');
      }
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
                    title: 'chat',
                    color: Colors.amber[600],
                    func: () {
                      AppRouter(context).push(ChatScreen());
                    },
                  ),
                  FlexBox(
                    title: 'flutter_chat_ui',
                    func: () {
                      AppRouter(context).push(const ChatUiScreen());
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
                    title: 'river_pod',
                    func: () {
                      AppRouter(context).push(const Riverpod());
                    },
                  ),
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
                    title: 'Emoji picker',
                    func: () {
                      showModalBottomSheet<Widget>(
                        context: context,
                        builder: (context) {
                          return EmojiPicker(
                            onEmojiSelected: (category, emoji) {
                              print(emoji.toString());
                            },
                            onBackspacePressed: () {
                              print('on tap backspace');
                            },
                            config: Config(
                                columns: 7,
                                emojiSizeMax: 32 *
                                    (Platform.isIOS
                                        ? 1.30
                                        : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                initCategory: Category.RECENT,
                                bgColor: Color(0xFFF2F2F2),
                                indicatorColor: Colors.blue,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.blue,
                                progressIndicatorColor: Colors.blue,
                                backspaceColor: Colors.blue,
                                skinToneDialogBgColor: Colors.white,
                                skinToneIndicatorColor: Colors.grey,
                                enableSkinTones: true,
                                showRecentsTab: true,
                                recentsLimit: 28,
                                noRecentsText: "No Recents",
                                noRecentsStyle: const TextStyle(
                                    fontSize: 20, color: Colors.black26),
                                tabIndicatorAnimDuration: kTabScrollDuration,
                                categoryIcons: const CategoryIcons(),
                                buttonMode: ButtonMode.MATERIAL),
                          );
                        },
                      );
                    },
                  ),
                  FlexBox(
                    title: 'GitHub',
                    func: () {
                      launchURL('https://github.com/nakapon9517', false);
                    },
                  ),
                  FlexBox(
                    title: 'pub.dev(to OS browser)',
                    func: () {
                      launchURL('https://pub.dev/', true);
                    },
                  ),
                  FlexBox(
                    title: 'Open mailer',
                    func: () {
                      const OpenMailer().openMailApp();
                    },
                  ),
                  FlexBox(
                    title: 'email send',
                    func: () {
                      AppRouter(context).push(const EmailSender());
                    },
                  ),
                  FlexBox(
                    title: 'screen lock',
                    func: () {
                      screenLock<dynamic>(
                        context: context,
                        title: const Text('パスワード'),
                        confirmTitle: const Text('確認'),
                        correctString: '1234',
                        canCancel: true,
                        confirmation: false,
                        didConfirmed: (dynamic matchedText) {
                          print(matchedText);
                        },
                        inputController: inputController,
                        customizedButtonChild: const Icon(
                          Icons.fingerprint,
                        ),
                        customizedButtonTap: () async {
                          await localAuth(context);
                        },
                        didOpened: () async {
                          await localAuth(context);
                        },
                      );
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
