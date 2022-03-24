import 'package:example/constants.dart';
import 'package:example/screens/root_screen.dart';
import 'package:example/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

// riverpod
final counterProvider = StateProvider((ref) => 0);
final themeProvider = StateNotifierProvider<MyThemeRiverpod, ThemeData>(
    (ref) => MyThemeRiverpod());

void main() {
  initializeDateFormatting()
      .then((_) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: myTheme,
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// provider
// void main() {
//   initializeDateFormatting().then((_) => runApp(const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => MyTheme(),
//       child: Consumer<MyTheme>(
//         builder: (context, theme, _) {
//           return MaterialApp(
//             theme: theme.current,
//             home: const RootScreen(),
//             debugShowCheckedModeBanner: false,
//           );
//         },
//       ),
//     );
//   }
// }
