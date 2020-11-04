import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';
import '../models/countries.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/ErrorWidget.dart';
import '../widgets/fetchupdates.dart';


class TablesScreen extends StatefulWidget {
  static String routeName = '/tables';

  @override
  _TablesScreenState createState() => _TablesScreenState();
}


class _TablesScreenState extends State<TablesScreen> {
  bool _buttonPressed = false,_dataFetched = false;
  List <TableRow> _tableRows = [];

  var response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Tables'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buttonPressed?(_dataFetched?SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Table(
            border: TableBorder.all(width: 1),
            children: _tableRows

        ),
      ):ErrorBox()):FetchUpdates(),
      floatingActionButton: IconButton(
        highlightColor: Colors.green,
        icon: Icon(Icons.refresh),
        onPressed: () async{
          _buttonPressed = true;
          String url = 'https://api.covid19api.com/summary';
          try{
            response = await http.get(url);
            Map alpha  = json.decode(response.body);
            _tableRows.clear();
            data.clear();
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
                countryName: element['Country'],
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
          int i = 1;
          data.forEach((element) {
            _tableRows.add(
              TableRow(
                  children: [
                    Text('$i',style: TextStyle(
                      fontSize: 15,
                    ),textAlign: TextAlign.center),
                    Text('${element.countryName}',style: TextStyle(
                      fontSize: 10,
                    ),textAlign: TextAlign.center),
                    Text('${element.totalCases}',style: TextStyle(
                      fontSize: 15,
                    ),textAlign: TextAlign.center),
                    Text('${element.totalRecovered}',style: TextStyle(
                      fontSize: 15,
                    ),textAlign: TextAlign.center,),
                    Text('${element.totalDeaths}',style: TextStyle(
                      fontSize: 15,
                    ),textAlign: TextAlign.center),
                  ]
              ),
            );
            i++;
          });
          setState(() {});
        },
        color: Theme.of(context).primaryColor,
      ),

    );
  }
}
