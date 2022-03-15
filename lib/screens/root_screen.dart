import 'package:example/screens/home/home_screen.dart';
import 'package:example/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(title: 'Home'),
    const SettingsScreen(),
  ];

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onSelected,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
