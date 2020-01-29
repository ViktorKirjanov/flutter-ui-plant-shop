import 'package:flutter/foundation.dart';

class Plant {
  String name;
  List<String> type;
  bool top;
  bool plantOfTheMonth;
  double price;
  String image;
  String size;
  String desctiption;
  int potSize;
  int minSize;
  int maxSize;

  Plant({
    @required this.name,
    @required this.type,
    @required this.top,
    @required this.plantOfTheMonth,
    @required this.price,
    @required this.image,
    @required this.size,
    @required this.desctiption,
    @required this.potSize,
    @required this.minSize,
    @required this.maxSize,
  });
}
