import 'package:flutter/material.dart';
import 'package:realtime_firebase/res/color.dart';

class RoundedButton extends StatelessWidget {
  String title;
  Color? color,textColor;
  VoidCallback onTap;
  bool loading;
  RoundedButton({Key? key,required this.title,this.color = AppColors.primaryMaterialColor,this.textColor = AppColors.primaryMaterialColor,required this.onTap,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: AppColors.primaryMaterialColor),
          color: color,
        ),
        child: loading ? Center(child: CircularProgressIndicator(color: AppColors.whiteColor,)) : Center(
            child: Text(title,style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16.0),)),
      ),
    );
  }
}
