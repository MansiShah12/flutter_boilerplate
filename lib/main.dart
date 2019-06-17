import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/screens/LoginScreen/login_screen.dart';
import 'package:flutter_boilerplate/src/screens/Navigators/BottomTabNavigation/index.dart';
import 'package:flutter_boilerplate/src/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main() {
  final store = createStore();
  runApp(ReduxApp(store: store));
}
class ReduxApp extends StatelessWidget {
  final Store<AppState> store;
  
  ReduxApp({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.grey,
              body:LoginScreen()); 
            
          }
        }
      ),
    );
  }
}