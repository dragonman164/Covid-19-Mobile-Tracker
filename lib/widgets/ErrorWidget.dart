import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/danger.jpg'),
        ),
        Text('Sorry Latest Data wasn\'t fetched due to Network Issue. Please Check your Internet Connection and Try Again',
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,)
      ],
    );
  }
}
