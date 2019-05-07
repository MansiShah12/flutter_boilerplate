import 'package:flutter/material.dart';

import './TabBarScreens/home_screen.dart';
import './TabBarScreens/map_screen.dart';

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: SafeArea(
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.local_bar)),
                  Tab(icon: Icon(Icons.map))
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              First(),
              MapScreen(Colors.greenAccent),
            ],
          ),
        ),
      ),
    );
  }
}
