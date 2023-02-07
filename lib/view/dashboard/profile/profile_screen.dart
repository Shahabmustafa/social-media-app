import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         Row(
           children: [
             InkWell(
               onTap: ()async{
                 await FirebaseAuth.instance.signOut();
                 Navigator.pushNamed(context, RoutesName.loginScreen);
               },
               child: Text('Log In'),
             ),
             SizedBox(
               width: 10.0,
             ),
           ],
         ),
        ],
      ),
    );
  }
}
