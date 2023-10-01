import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/user_places.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<UserPlaces>(
        child: const Text('There are no places yet, Add some places!'),
        builder: (context, greatPlaces, child) {
          return greatPlaces.items.isEmpty
              ? Center(
                  child: child) // Return the child widget when the condition is true.
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            FileImage(greatPlaces.items[index].image),
                      ),
                      title: Text(greatPlaces.items[index].title),
                    );
                  },
                );
        },
      ),
    );
  }
}
