import 'package:flutter/material.dart';
import '../screens/about.dart';
import '../screens/graphs.dart';
import '../screens/tables.dart';
import '../screens/home.dart';
import '../screens/countrydetails.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/covid.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Table'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TablesScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.graphic_eq),
            title: Text('Graphs'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(GraphsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_people),
            title: Text('Country wise Details'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CountryDetails.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
            },
          ),

        ],
      ),
    );
  }
}
