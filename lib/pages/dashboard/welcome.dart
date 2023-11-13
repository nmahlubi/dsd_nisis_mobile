import 'package:flutter/material.dart';

import '../../navigation_drawer/navigation_drawer_menu.dart';
import '../../sessions/session.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'pages/dashboard/profile_page.dart';
import 'pages/dashboard/setting_page.dart';

// ignore: must_be_immutable
class WelcomePage extends StatefulWidget {
  Session session;
  WelcomePage({Key? key, required this.session, required String title})
      : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const DashboardPage(),
    const ProfilePage(),
    const SettingPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const NavigationDrawerMenu(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
