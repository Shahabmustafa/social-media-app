import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_firebase/res/color.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/view_model/profile/profile_contoller.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Stream documentStream = FirebaseFirestore.instance.collection('Users').doc(SessionController().userID.toString()).snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context,provider,child){
            return StreamBuilder(
              stream: documentStream,
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: data['profile'].toString() == "" ? Image.asset('') : Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(data['profile']),
                                loadingBuilder: (context,child,loadingProgress){
                                  if(loadingProgress == null)return child;
                                  return Center(
                                    child: CircularProgressIndicator(color: Colors.black,),
                                  );
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              provider.pickImage(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColors.primaryTextTextColor,
                              child: Icon(Icons.add,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ReusableRow(
                        iconData: Icons.person,
                        value: data['userName'],
                        title: 'User Name',
                      ),
                      ReusableRow(
                        iconData: Icons.email_outlined,
                        value: data['email'],
                        title: 'Email',
                      ),
                      ReusableRow(
                        iconData: Icons.phone,
                        value: data['phone'] == '' ? 'xxxx-xxx-xxx-x' : data['phone'],
                        title: 'Phone',
                      ),
                      InkWell(
                        onTap: ()async{
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                        child: Text('Log In'),
                      ),
                    ],
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        ),
      )
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title,value;
  final IconData iconData;
  ReusableRow({Key? key,required this.iconData,required this.value,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(title),
          subtitle: Text(value),
        ),
        Divider(
          color: AppColors.dividedColor.withOpacity(0.6),
        ),
      ],
    );
  }
}

