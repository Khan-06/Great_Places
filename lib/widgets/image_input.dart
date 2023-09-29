import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

   File? _storedImage;

   Future<void> _takePicture () async {
     final imagePicker = ImagePicker();
     final imageFile = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
   }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
          ),
          alignment: Alignment.center,
          child: _storedImage != null ? Image.file(_storedImage!, fit: BoxFit.cover, width: double.infinity,) : const Text('No Image Found', textAlign: TextAlign.center,),
        ),
        const SizedBox(width: 10,),
        Expanded(child: TextButton.icon(onPressed: _takePicture, icon: const Icon(Icons.camera), label: const Text('Take Picture'),))
      ],
    );
  }
}
