import 'package:flutter/material.dart';
import '../widgets/appdrawer.dart';

class TablesScreen extends StatelessWidget {
  static String routeName = '/tables';
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
                  Text('Row1',style: TextStyle(
                 fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('Row2',style: TextStyle(
                      fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('Row3',style: TextStyle(
                      fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                 ]
                ),
                TableRow(
                    children: [
                      Text('Row1',style: TextStyle(
                        fontSize:19
                      ),),
                      Text('Row2',style: TextStyle(
                          fontSize:19
                      ),),
                      Text('Row3',style: TextStyle(
                          fontSize:19
                      ),),
                    ]
                ),
                TableRow(
                    children: [
                      Text('Row1',style: TextStyle(
                          fontSize:19
                      ),),
                      Text('Row2',style: TextStyle(
                          fontSize:19
                      ),),
                      Text('Row3',style: TextStyle(
                          fontSize:19
                      ),),
                    ]
                ),
              ],

            ),
          )
        ],
      )
    );
  }
}

