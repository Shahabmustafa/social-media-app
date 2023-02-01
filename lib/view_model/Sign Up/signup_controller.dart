import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/utls.dart';

import '../services/session_manager.dart';

class signUpContoller with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseFirestore.instance.collection('Users');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void SignUp(BuildContext context ,String username,String email,String password)async{
    
    setLoading(true);
    
    try{
      auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        SessionController().userID = value.user!.uid.toString();
        user.doc(value.user!.uid.toString()).set({
          'Id' : value.user!.uid.toString(),
          'userName' : username,
          'email' : value.user!.email.toString(),
          'profile' : '',
          'onlineStatus' : 'null',
          'phone' : '',
        }).then((value){
          setLoading(false);
          Navigator.pushNamed(context, RoutesName.dashboard);
          Utils.toasstMessage('You have Sucessfully Sign In');
          },
        ).onError((error, stackTrace){
          Utils.toasstMessage(error.toString());
        },
        );
        Utils.toasstMessage(value.toString());
        setLoading(false);
        },
      ).onError((error, stackTrace){
        Utils.toasstMessage(error.toString());
        setLoading(false);
        },
      );
    }catch(e){
      setLoading(false);
      Utils.toasstMessage(e.toString());
    }
  }

}