import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Color color;

  ProfileScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'PROFILE SCREEN',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
