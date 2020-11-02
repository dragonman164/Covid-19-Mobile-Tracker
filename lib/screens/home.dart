import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/appdrawer.dart';
import '../models/globalmodel.dart';

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

 Widget displayDetails(GlobalModel obj) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
       ListTile(
         leading: Image(image: AssetImage('assets/covid.jpg')),
         title:   Text('Total Cases : ${obj.totalCases}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.orange,
           ),),

       ),
       ListTile(
         leading: Image(image: AssetImage('assets/danger.jpg'),),
         title:  Text('Total Deaths : ${obj.totalDeaths}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.red,
           ),),
       ),
       ListTile(
         leading: Image(image: AssetImage('assets/plus.png'),),
         title:   Text('Total Recovered : ${obj.totalRecovered}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.green,
           ),),
       ),
       ListTile(
         leading: Image(image: AssetImage('assets/covid.jpg'),),
         title:  Text('New Confirmed : ${obj.newConfirmed}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.orange,
           ),),
       ),
       ListTile(
         leading: Image(image: AssetImage('assets/danger.jpg'),),
         title:    Text('New Deaths : ${obj.newDeaths}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.red,
           ),),
       ),
       ListTile(
         leading: Image(image: AssetImage('assets/plus.png'),),
         title:    Text('New Recovered : ${obj.newRecovered}',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.green,
           ),),
       ),

     ],
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



