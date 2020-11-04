import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';

class CountryDetails extends StatefulWidget {
  static String routeName='/countryDetails';
  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details Screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
        DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )
        ],
      ),
    );
  }
}
