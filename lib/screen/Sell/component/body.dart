import 'package:commerce/screen/Sell/tabs/MyShop/myshop.dart';
import 'package:commerce/screen/Sell/tabs/deleteMyShop/delete_my_shop.dart';
import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User.svg",
          text: "My Shop",
          press: () {Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => MyShop(),
            ),
          );},
        ),
        ProfileMenu(
          icon: "assets/icons/Cash.svg",
          text: "My Cash",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          press: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => DeleteMyShop(),
                ),
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Log out.svg",
                  width: 22,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "Delete My Shop",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.white,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
