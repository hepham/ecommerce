import 'package:flutter/material.dart';


import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(icon: "assets/icons/User.svg",text: "My Account",press: (){},),
        ProfileMenu(icon: "assets/icons/Cash.svg",text: "My Cash",press: (){},),
        ProfileMenu(icon: "assets/icons/Settings.svg",text: "Settings",press: (){},),
        ProfileMenu(icon: "assets/icons/Log out.svg",text: "Log Out",press: (){},),

      ],
    );
  }
}


