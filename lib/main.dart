import 'package:covid_tracker/screens/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'screens/about.dart';
import 'screens/graphs.dart';
import 'screens/tables.dart';
import 'screens/home.dart';


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
        '/' :(context)=> LoadingScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        AboutScreen.routeName : (context)=> AboutScreen(),
        TablesScreen.routeName : (context)=>TablesScreen(),
        GraphsScreen.routeName: (context)=>GraphsScreen(),
        AboutScreen.routeName: (context)=>AboutScreen(),
      },

    );
  }
}

