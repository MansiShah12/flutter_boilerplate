import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  _onDrawerTileTap(context) {
    Navigator.pop(context);
  }

  _drawerList(context, title, icon) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          _onDrawerTileTap(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 20.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(' Flutter ', style: TextStyle(fontSize: 30)),
              accountEmail:
                  Text('flutter@gmail.com', style: TextStyle(fontSize: 20)),
              currentAccountPicture:Center(
                child:
                  Image.network('https://pbs.twimg.com/profile_images/1022518859906142208/NI18dlQg_400x400.jpg'),),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            _drawerList(context, 'My Profile', Icons.account_circle),
            _drawerList(context, 'Settings', Icons.settings),
            _drawerList(context, 'Logout', Icons.arrow_back),
          ],
        ));
  }
}
