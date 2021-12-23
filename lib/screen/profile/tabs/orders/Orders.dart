import 'package:commerce/component/Button.dart';
import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/profile/tabs/orders/Body.dart';
import 'package:commerce/screen/Cart/component/checkoutCard.dart';
import 'package:commerce/screen/profile/tabs/orders/OrderCheck.dart';
import 'package:flutter/material.dart';



class OrderScreen extends StatelessWidget {
  static String routeName = '/order';
  const OrderScreen({Key? key}) : super(key: key);

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
              'Orders',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            // Text(
            //   '${demoCart.length} items',
            //   style:Theme.of(context).textTheme.caption ,
            // )
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar:OrderCheck(),

      // bottomNavigationBar: NavigationBar(selectedMenu: MenuState.cart),
    );
  }
}