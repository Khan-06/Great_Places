import 'package:flutter/material.dart';

import '../models/place.dart';

class UserPlaces with ChangeNotifier {
  List<Places> _items = [];
  List<Places> get items {
    return [..._items];
  }
}