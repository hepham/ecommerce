import 'package:commerce/config.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/start/component/body.dart';
class start extends StatelessWidget {
  static String routeName="/start";
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body:Body(),
    );
  }
}
