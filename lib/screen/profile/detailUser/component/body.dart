import 'package:commerce/models/user.dart';
import 'package:commerce/screen/profile/detailUser/component/description.dart';
import 'package:commerce/screen/profile/detailUser/component/productImage.dart';


import 'package:flutter/material.dart';

import '../../../../config.dart';


class Body extends StatelessWidget {
  final User user;
  const Body({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //hien thi anh

        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(30)),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: productImage(user: user),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        //description user
        userDecription(user: user),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    );
  }
}
