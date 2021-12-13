import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:commerce/screen/profile/detailUser/detailUserScreen.dart';
import 'package:commerce/screen/profile/tabs/logout.dart';
import 'package:commerce/screen/profile/tabs/mycash.dart';
import 'package:commerce/screen/profile/tabs/settings.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User.svg",
          text: "My Shop",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Cash.svg",
          text: "My Cash",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          press: () {},
        ),

      ],
    );
  }
}