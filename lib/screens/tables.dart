import 'package:flutter/material.dart';
import '';

class TablesScreen extends StatelessWidget {
  static String routeName = '/tables';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

