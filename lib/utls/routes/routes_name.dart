import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/view/login/login_screen.dart';
import 'package:realtime_firebase/view/sign%20up/signup_screen.dart';
import '../../view/Splash/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (_) => SigninScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
                child: Text("No Routes Defined for ${settings.name}"),
            ),
          );
        });
    }
  }
}