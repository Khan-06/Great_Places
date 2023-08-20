import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/user_places.dart';
import './screens/places_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber).copyWith(background: Colors.black),
        ),
        home: const PlaceListScreen(),
      ),
    );
  }
}
