import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: BottomTab(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Redux App'),
    );
  }
}
