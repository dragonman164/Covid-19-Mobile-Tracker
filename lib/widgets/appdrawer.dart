import 'package:flutter/material.dart';
import '../screens/about.dart';
import '../screens/graphs.dart';
import '../screens/tables.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Table'),
            onTap: () {
              Navigator.of(context).pushNamed(TablesScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.graphic_eq),
            title: Text('Graphs'),
            onTap: () {
              Navigator.of(context).pushNamed(GraphsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),

        ],
      ),
    );
  }
}
