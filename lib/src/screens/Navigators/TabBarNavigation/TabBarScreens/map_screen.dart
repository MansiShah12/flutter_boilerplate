import 'package:flutter/material.dart';
import '../../../MapScreen/maps.dart';
class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Maps(),
    );
  }
}

