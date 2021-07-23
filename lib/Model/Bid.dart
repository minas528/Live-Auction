import 'package:flutter_app2/Model/Person.dart';

class Bid {
  String name;
  String imgURL;
  int endTime;
  Person owener;
  Map bids= new Map() ;

  Bid({required this.name, required this.imgURL, required this.endTime,required this.owener});
}
