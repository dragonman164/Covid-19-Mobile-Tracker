import 'package:flutter/material.dart';

class ListTile extends StatelessWidget {
 final String text;
  final List colorList ;
  ListTile({
    @required this.text,
    @required this.colorList});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: colorList,
        ),
        boxShadow: [BoxShadow(
          color: Colors.black,
          blurRadius: 12,
        ),],
      ),
      child: Center(
        child: Text(text,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}
