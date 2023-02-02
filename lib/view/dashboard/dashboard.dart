import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:realtime_firebase/res/color.dart';
import 'package:realtime_firebase/utls/routes/routes.dart';
import 'package:realtime_firebase/view/dashboard/profile/profile_screen.dart';
import 'package:realtime_firebase/view_model/services/session_manager.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen(){
    return [
      Text('Home'),
      Text('Message'),
      Text('Camera'),
      Text(''),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem(){
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.home,),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.home,color: Colors.grey.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.message,),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.message,color: Colors.grey.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.add,),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.add,color: Colors.grey.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.home,),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.home,color: Colors.grey.shade100,)
      ),
      PersistentBottomNavBarItem(icon: Icon(Icons.person_outline,),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.person_outline,color: Colors.grey.shade100,)
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      backgroundColor: AppColors.secondaryTextColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
