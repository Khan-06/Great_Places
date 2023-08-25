import 'package:flutter/material.dart';

import './add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, AddPlaceScreen.routeName);
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
