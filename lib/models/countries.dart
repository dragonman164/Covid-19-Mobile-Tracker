import 'package:flutter/foundation.dart';
// This Class should be modified later to Plot Graphs
class Countries {
  DateTime date;
  int totalCases,totalRecovered,totalDeaths,newConfirmed,newRecovered,newDeaths;
  Countries({
    @required this.date,
    @required this.totalCases,
    @required this.totalRecovered,
    @required this.totalDeaths,
    @required this.newConfirmed,
    @required this.newRecovered,
    @required this.newDeaths,
  });

}