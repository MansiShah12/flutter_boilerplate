import 'package:flutter/material.dart';
import '../../../MapScreen/maps.dart';
class Map extends StatelessWidget {
 final bool fromTab;
Map({Key key, @required this.fromTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     home: new Maps(fromTab: fromTab),
    );
  }
}

