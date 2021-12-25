import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:commerce/screen/profile/tabs/changepassword.dart';
import 'package:commerce/screen/profile/tabs/updateUserInfo//update_user_info.dart';

import 'package:flutter/material.dart';



class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("User Settings",style: TextStyle(color: Colors.white),),

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            );
            setState(() {

            });
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
            text: "Update My Information",
            icon: "assets/icons/User.svg",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => UpdateUserInfo(),
                ),
              );
              setState(() {

              });
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
                setState(() {

                });
              },),
        ],
      ),
    );
  }
}
