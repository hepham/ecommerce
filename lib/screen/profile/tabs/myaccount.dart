import 'package:commerce/screen/profile/component/profile_menu.dart';

import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:commerce/screen/profile/tabs/changeUserName/changeusername.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';



class MyAccount extends StatelessWidget {

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
              SizedBox(
                height: 170,
                width: 170,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                    Positioned(
                      right: -12,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ProfileMenu(
            text: userName.toString(),
            icon: "assets/icons/User.svg",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ChangeUserName(),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Color(0xFFF5F6F9),
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Mail.svg",
                    width: 22,
                    color: Color(0xFFFF4848),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "DangDepTrai@gmail.com",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
