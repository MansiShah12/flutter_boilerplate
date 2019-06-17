import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_boilerplate/src/models/message.dart';
 
 
void main() => runApp(new PushNotifications());
 
class PushNotifications extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
 
  final String title;
 
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
 
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
       },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {  
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token){
      print("token is +++++++ $token");
    });
  }
 
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      )
    );}
 
  Widget buildMessage(Message message) => ListTile(
    title:Text(message.title),
    subtitle:Text(message.body)

  );
  }
