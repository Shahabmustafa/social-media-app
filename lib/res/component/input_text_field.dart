import 'package:flutter/material.dart';
import 'package:realtime_firebase/res/color.dart';

class InputTextField extends StatelessWidget {
  InputTextField({Key? key,
    required this.focusNode,
    required this.controller,
    required this.onFiledSubmittedvalue,
    required this.obsecureText,
    required this.hint,
    required this.keyboardType,
    this.autoFocus = false,
    this.enable = true,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedvalue;
  final FormFieldValidator validator;
  final TextInputType keyboardType;
  final String hint;
  final bool obsecureText;
  final bool enable,autoFocus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFiledSubmittedvalue,
        obscureText: obsecureText,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0, fontSize: 19.0),
        decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding: EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0, color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.secondaryColor),
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.alertColor),
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
        ),
      ),
    );
  }
}
