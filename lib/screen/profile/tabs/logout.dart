

import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:commerce/screen/signIn/SignInScreen.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class LogOut extends StatefulWidget{

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: 300),
          Text("Do You Want To LogOut?",style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
          )),
          SizedBox(height: 30),
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
                        builder: (ctx) => SignInScreen(),
                      ),
                    );
                    setState(() {

                    });
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
                        builder: (ctx) => ProfileScreen(),
                      ),
                    );
                    setState(() {

                    });
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