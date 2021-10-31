import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:commerce/screen/Home/component/iconbtn.dart';
import 'package:commerce/screen/Home/component/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';

class homeHeader extends StatelessWidget {
  const homeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(svgSrc: 'assets/icons/Cart.svg', press: ()=>Navigator.pushNamed(context, CartScreen.routeName)),
          IconBtnWithCounter(svgSrc: 'assets/icons/Bell.svg',numOfitem: 10, press: () {}),

        ],
      ),
    );
  }
}
