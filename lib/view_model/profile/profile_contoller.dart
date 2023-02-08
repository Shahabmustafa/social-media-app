import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController with ChangeNotifier{

  ImagePicker imagePicker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  Future pickCameraImage(BuildContext context)async{
    final picked = await imagePicker.pickImage(source: ImageSource.camera);
    if(picked != null){
      _image = XFile(picked.path);
    }
  }

  Future pickGalleryImage(BuildContext context)async{
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);
    if(picked != null){
      _image = XFile(picked.path);
    }
  }

  void pickImage(context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Container(
          width: 250.0,
          height: 120.0,
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  pickCameraImage(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
              ),
              ListTile(
                onTap: (){
                  pickGalleryImage(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}