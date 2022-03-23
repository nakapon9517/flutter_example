import 'package:example/main.dart';
import 'package:example/screens/home/components/flex_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Riverpod extends ConsumerWidget {
  const Riverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: myTheme.backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: FlexBox(
          title: 'change Dark mode',
          color: ThemeData.dark().primaryColor,
          func: () {
            ref.read(themeProvider.notifier).toggle();
          },
        ),
      ),
    );
  }
}
