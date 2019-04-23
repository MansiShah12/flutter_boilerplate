import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
 final Color color;

 MapScreen(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
     child:Center(child: Text(
       'MAP SCREEN',
       style: TextStyle(fontSize: 30, color: Colors.white),
     ),),
   );
 }
}