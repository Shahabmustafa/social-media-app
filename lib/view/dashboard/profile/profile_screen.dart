import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_firebase/res/color.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final user = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: user.doc('${SessionController().userID.toString()}').snapshots(),
          builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData){
            Map<dynamic,dynamic> map = snapshot.data.snapshot;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryTextColor,
                        width: 5.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkgXWUMr_Vcw6KhaHLTy0SNSljgWrMIi5rFQ&usqp=CAU'),
                        loadingBuilder: (context,child,loadingProgress){
                          if(loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context,object,stack){
                          return Container(
                            child: Icon(Icons.error_outline,),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(map['userName']),
                ),
              ],
            );
          }else{
            return const Center(
                child: Text('Something went wrong'),
            );
          }
            },
      ),
    );
  }
}
