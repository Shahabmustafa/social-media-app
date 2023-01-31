import 'package:flutter/material.dart';
import 'package:realtime_firebase/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService service = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.isLogin(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/apple.png',height: 80.0,width: 80.0,)
        ],
      ),
    );
  }
}
