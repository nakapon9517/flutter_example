import 'package:example/constants.dart';
import 'package:example/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: appPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: appTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
