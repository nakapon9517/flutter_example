import 'package:example/constants.dart';
import 'package:example/screens/slider/slider_screen.dart';
import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';

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
            title: const Text('Login'),
            onTap: () {
              _onPressNavigator(context, const LoginScreen(title: 'Login'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Slider / Storage'),
            onTap: () {
              _onPressNavigator(context, const LocalStorageScreen());
            },
          ),
        ],
      ),
    );
  }
}
