import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/user.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/Sell/sell_screen.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';
import '../../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.14), // 14%
                Text("Register As A Seller", style: headingStyle),
                Text(
                  "You haven't register as a Seller\n Do you wish to sell something?",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(50),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          user.isSeller = true;
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => SellScreen(),
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
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(50),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => homeScreen(),
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
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.08),

                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
