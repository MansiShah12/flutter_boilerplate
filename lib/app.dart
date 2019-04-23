import 'package:flutter/material.dart';
import './src/screens/LoginScreen/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.blue),
        home: LoginScreen(),
      );
}
