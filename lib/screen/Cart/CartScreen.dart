import 'dart:async';

import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/Cart/component/Body.dart';
import 'package:commerce/screen/Cart/component/checkoutCard.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Timer _timer;
  void startTimer() {
    Body.isUpdate= false;
    const oneSec = const Duration(milliseconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (Body.isUpdate&& this.mounted) {
          Body.isUpdate=false;
          setState(() {});
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => homeScreen(),
              ),
            );
          },
        ),
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