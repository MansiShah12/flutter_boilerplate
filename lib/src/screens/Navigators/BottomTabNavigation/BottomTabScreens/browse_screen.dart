import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
 bool fromTab;
  BrowseScreen({Key key, @required this.fromTab}) : super(key: key);
  

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
        color: Colors.lime,
        child : Center(
        child: Text(
          'Browse SCREEN',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      )
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Image from assets"),
    //     ),
    //     body: Image.asset('assets/images/wait.jpg'), //   <--- image here
    //   ),
    // );
  }
}
