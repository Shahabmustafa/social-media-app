import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realtime_firebase/utls/utls.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';

class ProfileController with ChangeNotifier{

  ImagePicker imagePicker = ImagePicker();
  final _user = FirebaseFirestore.instance.collection('Users');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  XFile? _image;
  XFile? get image => _image;

  Future pickCameraImage(BuildContext context)async{
    final picked = await imagePicker.pickImage(source: ImageSource.camera);
    if(picked != null){
      _image = XFile(picked.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  Future pickGalleryImage(BuildContext context)async{
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);
    if(picked != null){
      _image = XFile(picked.path);
      notifyListeners();
      uploadImage(context);
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

  void uploadImage(BuildContext context)async{
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref('profileImage' + SessionController().userID.toString());
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(SessionController().userID.toString()).update({
      'profile' : newUrl.toString(),
    }).then((value){
      Utils.toasstMessage('Update Peofile');
      _image = null;
    }).onError((error, stackTrace){
      Utils.toasstMessage(error.toString());
    });
  }
}