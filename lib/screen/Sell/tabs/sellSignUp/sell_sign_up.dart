import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/Sell/tabs/sellSignUp/body.dart';
import 'package:flutter/material.dart';

import '../../../../enums.dart';

class SellSignUp extends StatefulWidget {
  @override
  State<SellSignUp> createState() => _SellSignUpState();
}

class _SellSignUpState extends State<SellSignUp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

        title: Text(
          "My Shop",
          style: TextStyle(color: Colors.white),
        ),

      ),
      body: Body(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.sell),
    );
  }
}
