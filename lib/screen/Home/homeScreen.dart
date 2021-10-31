import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/enums.dart';
import 'package:commerce/screen/Home/component/Body.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  static String routeName = '/home';
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.home),
    );
  }
}
