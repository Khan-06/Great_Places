import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/user_places.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const routeName = '/add-place';
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }
  void _savePlace (){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<UserPlaces>(context, listen: false).addPlaces(_titleController.text , _pickedImage!);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     ImageInput(selectImage),
                     const SizedBox(height: 10),
                     LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          OutlinedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      // Return the color for the disabled state
                      return Colors.grey; // Or any other color you prefer
                    }
                    // Return the color for the default state
                    return Theme.of(context).colorScheme.primary;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      // Return the color for the disabled state
                      return Colors.grey; // Or any other color you prefer
                    }
                    // Return the color for the default state
                    return Theme.of(context).colorScheme.secondary;
                  },
                ),
              )),
        ],
      ),
    );
  }
}
