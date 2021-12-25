
import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'component/body.dart';

class SellScreen extends StatefulWidget {
  static String routeName = '/sell';
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
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
            setState(() {});
          },
        ),

        elevation: 0.0,

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
