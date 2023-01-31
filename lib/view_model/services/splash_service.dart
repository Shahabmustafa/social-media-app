import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'dart:async';

class SplashService{

  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context, RoutesName.loginScreen));
  }
}