import 'package:flutter/material.dart';
class FetchUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image(image: AssetImage('assets/masks.png'),),
          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        ),
        Text('Welcome to Covid19 Tracker App',style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
          textAlign: TextAlign.center,),
        SizedBox(height: 50,),
        Text('Please click on Refresh Button to Fetch latest updates for virus',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,),
      ],
    );
  }
}

