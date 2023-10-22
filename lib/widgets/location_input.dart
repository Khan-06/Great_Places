import 'package:flutter/material.dart';

import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getUserLocation () async {
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 1)
          ),
          width: double.infinity,
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(onPressed: _getUserLocation, icon: const Icon(Icons.location_on), label: Text('Current Location',style: TextStyle(color: Theme.of(context).primaryColor)),),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.map), label:  Text('Select on Map',style: TextStyle(color: Theme.of(context).primaryColor)))
          ],
        )
      ],
    );
  }
}
