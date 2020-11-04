import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/appdrawer.dart';
import '../models/globalmodel.dart';
import '../widgets/ListTile.dart';
import '../widgets/fetchupdates.dart';
import '../widgets/ErrorWidget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool _buttonPressed = false,_dataFetched = false;
GlobalModel globalModel;
 var response;

  Widget displayDetails(GlobalModel obj){
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
     child: GridView.count(
       crossAxisCount: 2,
       crossAxisSpacing: 20,
       mainAxisSpacing: 20,
       children: [
       ListObject(text:'Total Cases : ${obj.totalCases}',colorList: [Colors.orange,Colors.red],),
         ListObject(text: 'Total Deaths : ${obj.totalDeaths}',colorList: [Colors.green,Colors.yellow],),
         ListObject(text:'Total Recovered : ${obj.totalRecovered}',colorList:[Colors.pink,Colors.orange],),
         ListObject(text: 'New Confirmed : ${obj.newConfirmed}',colorList: [Colors.deepOrange,Colors.yellow],),
         ListObject(text: 'New Deaths : ${obj.newDeaths}',colorList:  [Colors.red,Colors.greenAccent],),
        ListObject(text: 'New Recovered : ${obj.newRecovered}',colorList:  [Colors.red,Colors.cyan],),

       ],
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Covid19 Tracker'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buttonPressed?(_dataFetched?displayDetails(globalModel):ErrorBox()):FetchUpdates(),
      floatingActionButton: IconButton(
        highlightColor: Colors.green,
        icon: Icon(Icons.refresh),
        onPressed: () async{
          _buttonPressed = true;
          String url = 'https://api.covid19api.com/summary';
          try{
          response = await http.get(url);
          Map alpha  = json.decode(response.body);

         globalModel = GlobalModel (date: DateTime.now(),
            totalCases: alpha['Global']['TotalConfirmed'],
          totalDeaths: alpha['Global']['TotalDeaths'],
            totalRecovered: alpha['Global']['TotalRecovered'],
          newConfirmed: alpha['Global']['NewConfirmed'],
          newDeaths: alpha['Global']['NewDeaths'],
          newRecovered: alpha['Global']['NewRecovered']);
          _dataFetched = true;
          }
          catch(e){
            print('Error');
            _dataFetched = false;
          }
          setState(() {});
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}



