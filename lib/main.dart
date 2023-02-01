import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_firebase/res/color.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/utls/routes/routes_name.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20.0, color: AppColors.primaryTextTextColor)
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 10,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          headline2: TextStyle(fontSize: 15,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          headline3: TextStyle(fontSize: 20,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          headline4: TextStyle(fontSize: 25,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          headline5: TextStyle(fontSize: 30,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          headline6: TextStyle(fontSize: 35,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.bold,),
          bodyText1: TextStyle(fontSize: 17.0,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700),
          bodyText2: TextStyle(fontSize: 13.0,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700,height: 1.6),
          caption: TextStyle(fontSize: 12.0,color: AppColors.primaryTextTextColor,height: 2.26),
        )
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
