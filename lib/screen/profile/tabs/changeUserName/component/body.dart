import 'package:commerce/screen/profile/tabs/changeUserName/component/signform.dart';
import 'package:flutter/material.dart';

import '../../../../../config.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 80),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SignForm(),
            ],
          ),
        ),
      ],
    );
  }
}