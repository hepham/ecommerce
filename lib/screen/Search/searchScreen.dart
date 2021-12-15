import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Search/component/searchField.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/routes.dart';
import 'package:commerce/screen/Search/component/Body.dart';

import '../../enums.dart';
class searchScreen extends StatelessWidget {
  static String routeName = '/search';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: searchField(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.none),
    );
  }
}
