import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/utls.dart';

class forgetPasswordController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  ForgetPassword(BuildContext context ,String email)async{
    setLoading(true);
    try{
      auth.sendPasswordResetEmail(
          email: email,
      ).then((value){
        setLoading(false);
        Navigator.pushNamed(context, RoutesName.loginScreen);
        Utils.toasstMessage('Please Check Your Recover Password');
      }).onError((error, stackTrace){
        setLoading(false);
        Utils.toasstMessage(error.toString());
        });
    }catch(e){
      setLoading(false);
      Utils.toasstMessage(e.toString());
    }
  }
}