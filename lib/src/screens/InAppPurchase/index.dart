import 'package:flutter/material.dart';

void main() => runApp(InAppPurchase());

class InAppPurchase extends StatefulWidget {
  InApp createState() => InApp();
}

class InApp extends State<InAppPurchase> {
  bool firstSelected = false;
  bool secondSelected = false;

  appBar(context) {
    return AppBar(
        title: Text("InAppPurchase"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: <Widget>[
          new GestureDetector(
              onTap: () {
                print("onTap Worked");
                setState(() {
                  firstSelected:
                  true;
                });
              },
              child: Container(
                margin:EdgeInsets.fromLTRB(5, 5, 5, 2),
                  decoration: BoxDecoration(
                      border:new Border.all(color: Colors.blueAccent,width: 3,),
                           ),
                  child: ListTile(
                    leading: Text('Budweiser', style: TextStyle(fontSize: 20)),
                    title: Center (child:new Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text('\$1.99', style: TextStyle(fontSize: 20)),
                    )),
                    trailing: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff01A0C7),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("Buy",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ))),
          Divider(),
          SizedBox(height: 20),
          new GestureDetector(
              onTap: () {
                print("onTap Worked");
                setState(() {
                  secondSelected:true;
                });
              },
              child: Container(
                margin:EdgeInsets.fromLTRB(5, 5, 5, 2),
                  // decoration: BoxDecoration(
                  //    border:new Border.all(color: Colors.blueAccent,width: 3,),
                          
                  //         ),
                  child: ListTile(
                    leading: Text('Ale            ', style: TextStyle(fontSize: 20)),
                    title: Center (child:new Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text('\$1.99', style: TextStyle(fontSize: 20)),
                    )),
                    trailing: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff01A0C7),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("Buy",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
