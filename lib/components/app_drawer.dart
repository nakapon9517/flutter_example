import 'package:example/screens/slider/slider_screen.dart';
import 'package:example/utils/app_router.dart';
import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
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
              AppRouter(context).push(const LoginScreen(title: 'Login'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Slider / Storage'),
            onTap: () {
              AppRouter(context).push(const LocalStorageScreen());
            },
          ),
        ],
      ),
    );
  }
}
