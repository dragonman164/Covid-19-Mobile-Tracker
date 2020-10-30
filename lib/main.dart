import 'package:flutter/material.dart';
import 'screens/about.dart';
import 'screens/graphs.dart';
import 'screens/tables.dart';
import 'widgets/appdrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19 Tracker',
      color: Colors.pink,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      initialRoute: '/',
      routes: {
        '/' :(context)=> HomeScreen(),
        AboutScreen.routeName : (context)=> AboutScreen(),
        TablesScreen.routeName : (context)=>TablesScreen(),
        GraphsScreen.routeName: (context)=>GraphsScreen(),
        AboutScreen.routeName: (context)=>AboutScreen(),
      },

    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Covid19 Tracker'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('Welcome to Covid19 Tracker App'),
      ),
    );
  }
}

