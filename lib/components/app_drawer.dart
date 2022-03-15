import 'package:example/constants.dart';
import 'package:example/screens/bottom_sheet_screen.dart';
import 'package:example/screens/list_input_screen.dart';
import 'package:example/screens/local_storage_screen.dart';
import 'package:example/screens/url_launcher_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  void _onPressNavigator(BuildContext context, StatefulWidget widget) {
    Navigator.push(
      context,
      MaterialPageRoute<StatefulWidget>(
        builder: (context) => widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: appPrimaryColor,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Input'),
            onTap: () {
              _onPressNavigator(
                  context, const InputListScreen(title: 'Input / List'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Slider / Storage'),
            onTap: () {
              _onPressNavigator(context, const LocalStorageScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.browser_updated),
            title: const Text('Open browser'),
            onTap: () {
              _onPressNavigator(context, const UrlLauncherScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_bottom),
            title: const Text('Bottom sheet'),
            onTap: () {
              _onPressNavigator(context, const BottomSheetScreen());
            },
          ),
        ],
      ),
    );
  }
}
