import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/TabBarNavigation/TabBarScreens/user_screen.dart';

import './TabBarScreens/home_screen.dart';
import './TabBarScreens/map_screen.dart';
import '../../ImageSwiper/image_swiper.dart';

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: SafeArea(
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.local_bar)),
                  Tab(icon: Icon(Icons.map)),
                  Tab(icon: Icon(Icons.image)),
                  Tab(icon: Icon(Icons.account_circle)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              First(),
              Map(),
              ImageSwiper(),
              OwnerDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
