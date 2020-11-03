import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';
import '../models/countries.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TablesScreen extends StatefulWidget {
  static String routeName = '/tables';

  @override
  _TablesScreenState createState() => _TablesScreenState();
}


class _TablesScreenState extends State<TablesScreen> {
  bool _buttonPressed = false,_dataFetched = false;
  List <TableRow> _tableRows;

  var response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Tables'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Table(
              border: TableBorder.all(width: 1),
              children: [
                TableRow(
                  children: [
                    Text('Ehll'),
                  ]
                )
              ]

            ),
          )
        ],
      ),
      floatingActionButton: IconButton(
        highlightColor: Colors.green,
        icon: Icon(Icons.refresh),
        onPressed: () async{
          _buttonPressed = true;
          String url = 'https://api.covid19api.com/summary';
          try{
            response = await http.get(url);
            Map alpha  = json.decode(response.body);
            alpha['Countries'].forEach((element) {
              data.add(Countries(
                totalCases: element['TotalConfirmed'],
                totalDeaths: element['TotalDeaths'],
                date: DateTime.now(),
                totalRecovered: element['TotalRecovered'],
                newConfirmed: element['NewConfirmed'],
                newRecovered: element['NewRecovered'],
                newDeaths: element['NewDeaths'],
                countryCode: element['CountryCode'],
              ));
            });
            _dataFetched = true;
          }
          catch(e){
            print('Error');
            _dataFetched = false;
          }
          _tableRows.add(
            TableRow(
                children: [
                  Text('S No.',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center),
                  Text('Country',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center),
                  Text('Total Cases',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center),
                  Text('Total Recov.',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center,),
                  Text('Total Deaths',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center),
                ]
            ),
          );
          setState(() {});
        },
        color: Theme.of(context).primaryColor,
      ),

    );
  }
}

