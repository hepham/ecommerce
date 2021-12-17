import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/Sell/sell_screen.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';
import '../../../../constants.dart';



class DeleteMyShop extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
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
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.18),
          Text("Do You Wish To Continue?",style: headingStyle),
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          Text(
            "By continuing we will delete\n your selling permission and all your products\n Are you sure?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.redAccent),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          Center(
            child: SizedBox(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(50),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    user.isSeller = false;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => homeScreen(),
                      ),
                    );
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  )),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: SizedBox(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(50),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => SellScreen(),
                      ),
                    );
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  )),
            ),
          ),
        ],
      ),


    );
  }

}