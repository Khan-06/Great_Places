import 'package:flutter/material.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class UserPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlaces(String title, File imageFile) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: PlaceLocation(latitude: 1, longitude: 1),
        image: imageFile);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path},
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(latitude: 1, longitude: 1),
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
