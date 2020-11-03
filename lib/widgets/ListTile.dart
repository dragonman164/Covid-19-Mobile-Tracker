import 'package:flutter/material.dart';

class ListObject extends StatelessWidget {
 final String text;
  final List <Color>colorList ;
  ListObject({
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
          blurRadius: 3,
        ),],
      ),
      child: Center(
        child: Text(text,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}
