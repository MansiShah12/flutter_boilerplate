import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  bool fromTab;
  SettingScreen({Key key, @required this.fromTab}) : super(key: key);
  

 appBar(fromTab,context){
   if(!fromTab){
   return AppBar(
                title: Text("Images"),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                ));
                }else{
                  return null;
                }
 }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:appBar(fromTab,context),
      body: Container(
        color: Colors.deepOrange,
        child : Center(
        child: Text(
          'SETTING SCREEN',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      )
    );
  }
}
