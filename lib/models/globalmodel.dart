import 'package:flutter/foundation.dart';

class GlobalModel {
  DateTime date;
  int totalCases,totalRecovered,totalDeaths,newConfirmed,newRecovered,newDeaths;
  GlobalModel({
    @required this.date,
    @required this.totalCases,
    @required this.totalRecovered,
    @required this.totalDeaths,
  @required this.newConfirmed,
  @required this.newRecovered,
    @required this.newDeaths,
  });

}