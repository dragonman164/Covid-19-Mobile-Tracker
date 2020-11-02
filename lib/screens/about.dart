import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';
class AboutScreen extends StatelessWidget {
  static String routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This project was made by:-',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text('Name:-ABC' ,style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
              textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text('Stream:- Computer Science',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
              textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text('College:- ABC University',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
              textAlign: TextAlign.center,)
          ],
        ),
      )
    );
  }
}
