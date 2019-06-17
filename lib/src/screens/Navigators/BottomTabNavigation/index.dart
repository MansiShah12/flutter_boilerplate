import 'package:flutter/material.dart';

import './BottomTabScreens/profile_screen.dart';
import './BottomTabScreens/setting_screen.dart';
import './BottomTabScreens/browse_screen.dart';
import '../TabBarNavigation/index.dart';
import '../../DrawerBar/index.dart';

class BottomTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTab();
  }
}

class _BottomTab extends State<BottomTab> {
  int _currentIndex = 0;
  final List<Widget> _bottomTabScreens = [
    TabBarScreen(),
    BrowseScreen(fromTab: true),
    SettingScreen(fromTab: true),
    ProfileScreen(fromTab: true),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      drawer: DrawerBar(),
      body: _bottomTabScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Browse'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
