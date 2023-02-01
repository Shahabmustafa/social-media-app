import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_firebase/res/component/input_text_field.dart';
import 'package:realtime_firebase/res/component/rounded_button.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/utls.dart';
import 'package:realtime_firebase/view_model/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                Text('Welcome to APPLE',style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
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
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InputTextField(
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            enable: true,
                            onFiledSubmittedvalue: (value){},
                            obsecureText: true,
                            hint: 'Password',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value ){
                              return value.isEmpty ? 'Enter Password' : null;
                            },
                          ),
                        ],
                      ),
                    ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.forgetPassword);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                      child: Text('Forget Password',style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                ChangeNotifierProvider(
                    create: (_) => loginController(),
                  child: Consumer<loginController>(
                    builder: (context,provider,child){
                      return RoundedButton(
                          loading: provider.loading,
                          title: ('Log in'),
                          onTap: (){
                            if(_keyForm.currentState!.validate()){
                              provider.Login(
                                  context,
                                  emailController.text,
                                  passwordController.text,
                              );
                            }
                          }
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.signInScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15.0,decoration: TextDecoration.underline),
                        ),
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
