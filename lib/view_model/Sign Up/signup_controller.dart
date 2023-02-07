import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/utls.dart';

import '../services/session_manager.dart';

class signUpContoller with ChangeNotifier{

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
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
        ref.child(value.user!.uid.toString()).set({
          'Id' : value.user!.uid.toString(),
          'userName' : username,
          'email' : value.user!.email.toString(),
          'profile' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2ETPUM3G6l9Pe3VTHbMbx_yfLk5KqZ_kU9w&usqp=CAU',
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