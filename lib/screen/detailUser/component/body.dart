
import 'package:commerce/component/Button.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/models/user.dart';
import 'package:commerce/screen/detailUser/component/color.dart';
import 'package:commerce/screen/detailUser/component/description.dart';
import 'package:commerce/screen/detailUser/component/productImage.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class Body extends StatelessWidget {
  final User user;
  const Body({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //hien thi anh product

        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(30)),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: productImage(user: user),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),

        //description product

        userDecription(user: user),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),

        //hien thi màu
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: color(user: user),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),


        //button add cart
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),

        ),
      ],
    );
  }
}
