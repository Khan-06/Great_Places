import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  final Function onSelectImage;
  const ImageInput(this.onSelectImage, {super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

   File? _storedImage;

   Future<void> _takePicture () async {
     final picker = ImagePicker();
     final XFile? imageFile = await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
     File? file = File(imageFile!.path);

     setState(() {
       _storedImage = file;
     });
     final appDir = await syspaths.getApplicationDocumentsDirectory();
     final fileName = path.basename(imageFile.path);
     print(fileName);
     final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
     widget.onSelectImage(savedImage);
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
          child: _storedImage != null ? Image.file(_storedImage!, fit: BoxFit.cover, width: double.infinity,) : const Center(child: Icon(Icons.camera_alt_rounded,)),
        ),
        const SizedBox(width: 10,),
        Expanded(child: TextButton.icon(onPressed: _takePicture, icon: const Icon(Icons.camera), label: const Text('Take Picture'),))
      ],
    );
  }
}
