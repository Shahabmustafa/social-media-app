import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/utls.dart';

class signUpContoller with ChangeNotifier{

  final auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = false;
    notifyListeners();
  }

  void SignUp(String username,String email,String password)async{
    
    setLoading(true);
    
    try{
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
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