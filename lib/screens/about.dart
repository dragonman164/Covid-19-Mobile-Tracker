import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('About Screen'),
      ),
    );
  }
}
