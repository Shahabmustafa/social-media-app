import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import '../../view/Splash/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
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