import 'package:commerce/screen/detailUser/detailUserScreen.dart';
import 'package:commerce/screen/profile/tabs/logout.dart';
import 'package:commerce/screen/profile/tabs/myaccount.dart';
import 'package:commerce/screen/profile/tabs/mycash.dart';
import 'package:commerce/screen/profile/tabs/settings.dart';
import 'package:commerce/screen/signIn/SignInScreen.dart';
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
        ProfileMenu(
          icon: "assets/icons/User.svg",
          text: "My Account",
          press: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailUserScreen(),
              ),
            );
          },
        ),
        ProfileMenu(
          icon: "assets/icons/Cash.svg",
          text: "My Cash",
          press: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => MyCash(),
              ),
            );
          },
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          press: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Settings(),
              ),
            );
          },
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Log Out",
          press: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => LogOut(),
              ),
            );
          },
        ),
      ],
    );
  }
}
