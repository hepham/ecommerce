import 'package:commerce/screen/profile/tabs/changeUserName/component/body.dart';
import 'package:commerce/screen/profile/profile_screen.dart';


import 'package:flutter/material.dart';



class ChangeUserName extends StatefulWidget {
  @override
  State<ChangeUserName> createState() => _ChangeUserNameState();
}


class _ChangeUserNameState extends State<ChangeUserName> {
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
      body: Body(),
    );
  }
}
