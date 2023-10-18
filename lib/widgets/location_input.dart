import 'package:flutter/material.dart';
import 'package:location/location.dart';



class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null ? const Text('No Location Chosen', textAlign: TextAlign.center,): Image.network(_previewImageUrl!, fit: BoxFit.cover, width: double.infinity,) ,
        )
      ],
    );
  }
}
