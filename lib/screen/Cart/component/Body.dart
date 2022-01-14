import 'dart:async';

import 'package:commerce/hub/AppHub.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:commerce/models/cart.dart';

import '../../../config.dart';
import 'cartItem.dart';
import 'checkoutCard.dart';

class Body extends StatefulWidget {
  static bool isUpdate=false;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCart.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: UniqueKey(),
            // key: Key(demoCart[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCart.removeAt(index);
                Body.isUpdate=true;
                print(demoCart.length);

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(' delete a item')));


              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartItem(Cart: demoCart[index]),
          ),
        ),
      ),

    );
  }
}
