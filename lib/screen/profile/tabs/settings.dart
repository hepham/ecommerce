import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:commerce/screen/profile/tabs/changepassword.dart';
import 'package:commerce/screen/profile/tabs/changeUserName/changeusername.dart';
import 'package:flutter/material.dart';



class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 60),
            ],
          ),
          SizedBox(height: 30),
          ProfileMenu(
            text: "Change UserName",
            icon: "assets/icons/User.svg",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ChangeUserName(),
                ),
              );
            },),
          ProfileMenu(
              text: "Change Password",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ChangePassword(),
                  ),
                );
              },),
        ],
      ),
    );
  }
}
