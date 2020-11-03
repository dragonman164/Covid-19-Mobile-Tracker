import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/appdrawer.dart';
import '../models/globalmodel.dart';
import '../widgets/ListTile.dart';
import '../models/countries.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool _buttonPressed = false,_dataFetched = false;
GlobalModel globalModel;
 var response;

 Widget welcomeMessage() {
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

 Widget errorMessage() {
   return Center(
     child: Text('Sorry! Latest Data wasn\'t fetched'),
   );
 }

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
      body: _buttonPressed?(_dataFetched?displayDetails(globalModel):errorMessage()):welcomeMessage(),
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



