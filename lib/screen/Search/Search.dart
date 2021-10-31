import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/routes.dart';
import 'package:commerce/screen/Search/component/Body.dart';
class SearchScreen extends StatelessWidget {
  static String routeName = '/search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
