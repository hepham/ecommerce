import 'package:commerce/screen/profile/tabs/updateUserInfo/component/signform.dart';
import 'package:flutter/material.dart';

import '../../../../../config.dart';



class Body extends StatefulWidget{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [Column(
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
      ),]
    );
  }
}