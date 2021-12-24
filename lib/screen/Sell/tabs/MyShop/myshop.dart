import 'package:commerce/screen/Sell/tabs/MyShop/body.dart';
import 'package:flutter/material.dart';

import '../../sell_screen.dart';

class MyShop extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Shop",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => SellScreen(),
              ),
            );
          },
        ),
      ),
      body: Body(),
    );
  }
}