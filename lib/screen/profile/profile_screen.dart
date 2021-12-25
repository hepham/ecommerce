import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'component/body.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => homeScreen(),
              ),
            );
            setState(() {

            });
          },
        ),
        elevation: 0.0,

        title: Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.profile),
    );
  }
}
