import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config.dart';
import '../profile_screen.dart';
import 'changeusername.dart';
import 'myaccount.dart';

class MyCash extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          SizedBox(height: 30),
          ProfileMenu(
            text: "21510002490189",
            icon: "assets/icons/Cash.svg",
            press: () {
            },
          ),
        ],
      ),
    );
  }
}