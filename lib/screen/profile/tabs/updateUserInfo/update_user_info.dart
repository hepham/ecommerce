import 'package:commerce/screen/profile/tabs/updateUserInfo/component/body.dart';
import 'package:commerce/screen/profile/profile_screen.dart';


import 'package:flutter/material.dart';



class UpdateUserInfo extends StatefulWidget {
  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}


class _UpdateUserInfoState extends State<UpdateUserInfo> {
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
            setState(() {

            });
          },
        ),
      ),
      body: Body(),
    );
  }
}
