import 'dart:io'; // aita default dart:html thakbe aita change na korle error ashbe(dart:io)
// this is very important
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    text,
    style: TextStyle(color: color),
  )));
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);

    if (result != null && result.files.isNotEmpty) {

     for(int i=0; i<result.files.length; i++) // this technique is working
       {

         images.add(File(result.files[i].path!));
       }
    } else {

      // User canceled the picker
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return images;
}
