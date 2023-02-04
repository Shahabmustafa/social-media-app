import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/utls.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';

class loginController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void Login(BuildContext context,String email,String password)async{
    setLoading(true);
    try{
      auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value){
        SessionController().userID = value.user!.uid.toString();
        Navigator.pushNamed(context, RoutesName.dashboard);
        setLoading(false);
        Utils.toasstMessage('You Have Sucessfully Login');
        },
      ).onError((error, stackTrace){
        setLoading(false);
        Utils.toasstMessage(error.toString());
        },
      );
    }catch(e){
      setLoading(false);
      Utils.toasstMessage(e.toString());
    }
  }

}