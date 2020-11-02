import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';
class GraphsScreen extends StatelessWidget {
  static String routeName = '/graphs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(

        title: Text('Graphs'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text('Graph Screen'),
      ),
    );
  }
}
