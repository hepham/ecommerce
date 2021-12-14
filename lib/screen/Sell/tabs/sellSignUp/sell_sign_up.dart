import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/Sell/tabs/sellSignUp/body.dart';
import 'package:flutter/material.dart';

import '../../../../enums.dart';

class SellSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Shop",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => homeScreen(),
              ),
            );
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.sell),
    );
  }
}
