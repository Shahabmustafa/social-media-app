import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_firebase/view_model/Sign%20Up/signup_controller.dart';

import '../../res/component/input_text_field.dart';
import '../../res/component/rounded_button.dart';
import '../../utls/routes/routes.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  final  _keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
    body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: ChangeNotifierProvider(
            create: (_) => signUpContoller(),
            child: Consumer<signUpContoller>(
              builder: (context,provider,child){
                return SingleChildScrollView(
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
                                focusNode: userNameFocusNode,
                                controller: userNameController,
                                enable: true,
                                onFiledSubmittedvalue: (value){},
                                obsecureText: false,
                                hint: 'User Name',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value ){
                                  return value.isEmpty ? 'Enter User Name' : null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              InputTextField(
                                focusNode: emailFocusNode,
                                controller: emailController,
                                enable: true,
                                onFiledSubmittedvalue: (value){},
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
                      RoundedButton(
                          loading: provider.loading,
                          title: ('Sign Up'),
                          onTap: (){
                            if(_keyForm.currentState!.validate()){
                              provider.SignUp(context,userNameController.text, emailController.text, passwordController.text);
                            }
                          }
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                        child: Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15.0,decoration: TextDecoration.underline),
                                  ),
                                ]
                            )
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
