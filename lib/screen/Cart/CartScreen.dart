import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/Cart/component/Body.dart';
import 'package:commerce/screen/Cart/component/checkoutCard.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Column(

          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              '${demoCart.length} items',
              style:Theme.of(context).textTheme.caption ,
            )
          ],
        ),
      ),
      body: Body(),
        bottomNavigationBar:Checkout(),
      // bottomNavigationBar: NavigationBar(selectedMenu: MenuState.cart),
    );
  }
}
