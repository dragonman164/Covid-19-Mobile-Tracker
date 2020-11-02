import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';

class TablesScreen extends StatelessWidget {
  static String routeName = '/tables';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Tables'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('Tables Screen'),
      ),
    );
  }
}

