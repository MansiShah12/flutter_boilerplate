import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  final Color color;

  BrowseScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'BROWSE SCREEN',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
