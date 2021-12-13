
import 'package:commerce/component/navigationBar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'component/body.dart';

class SellScreen extends StatelessWidget {
  static String routeName = '/sell';
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "My Shop",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.sell),
    );
  }
}
