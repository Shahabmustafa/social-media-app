import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'dart:async';
import 'package:realtime_firebase/view_model/services/session_manager.dart';

class SplashService{

  void isLogin(BuildContext context){
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      SessionController().userID = user.uid.toString();
      Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, RoutesName.dashboard));
    }else{
      Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, RoutesName.loginScreen));
    }
  }
}