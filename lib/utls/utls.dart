import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realtime_firebase/res/color.dart';

class Utils{
  static void fieldFocus(BuildContext context, FocusNode currentNode,FocusNode nextFocus){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toasstMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.primaryTextTextColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0,
    );
  }
}