import 'package:flutter/material.dart';
import 'dart:io';

import '../models/place.dart';

class UserPlaces with ChangeNotifier {
  List<Places> _items = [];
  List<Places> get items {
    return [..._items];
  }

  void addPlaces (String title, File imageFile){
    final newPlace = Places(id: DateTime.now().toString(), title: title, location: PlaceLocation(latitude: 1, longitude: 1), image: imageFile);
    _items.add(newPlace);
  }
}
