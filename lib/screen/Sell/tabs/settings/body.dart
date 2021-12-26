import 'package:commerce/screen/Sell/tabs/settings/addProduct/new_product_images.dart';
import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';

class Body extends StatefulWidget{

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),

              ProfileMenu(
                icon: "assets/icons/Plus Icon.svg",
                text: "Add New Product",
                press: () {Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => NewProductImage(),
                  ),
                );
                setState(() {

                });},
              ),
              ProfileMenu(
                icon: "assets/icons/Parcel.svg",
                text: "Change a Product",
                press: () {},
              ),
              ProfileMenu(
                icon: "assets/icons/Trash.svg",
                text: "Delete A Product",
                press: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
            ],
          ),
        )
    );
  }
}