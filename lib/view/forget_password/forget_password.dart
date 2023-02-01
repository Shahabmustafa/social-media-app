import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_firebase/view_model/forget_password/forget_password_controller.dart';

import '../../res/component/input_text_field.dart';
import '../../res/component/rounded_button.dart';
import '../../utls/routes/routes.dart';
import '../../utls/utls.dart';
import '../../view_model/login/login_controller.dart';


class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final  _keyForm = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Image.asset('assets/images/apple.png',height: 50.0,width: 50.0,),
                SizedBox(
                  height: height * 0.03,
                ),
                Text('Forget Password',style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
                SizedBox(
                  height: height * 0.03,
                ),
                Form(
                  key: _keyForm,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Column(
                      children: [
                        InputTextField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          enable: true,
                          onFiledSubmittedvalue: (value){
                            Utils.fieldFocus(context, emailFocusNode, passwordFocusNode);
                          },
                          obsecureText: false,
                          hint: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value ){
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ChangeNotifierProvider(
                  create: (_) => forgetPasswordController(),
                  child: Consumer<forgetPasswordController>(
                    builder: (context,provider,child){
                      return RoundedButton(
                          loading: provider.loading,
                          title: ('Recover'),
                          onTap: (){
                            if(_keyForm.currentState!.validate()){
                              provider.ForgetPassword(
                                context,
                                emailController.text,
                              );
                            }
                          }
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
