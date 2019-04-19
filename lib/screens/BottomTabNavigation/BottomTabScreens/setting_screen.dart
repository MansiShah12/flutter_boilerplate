import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final Color color;

  SettingScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'SETTING SCREEN',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
