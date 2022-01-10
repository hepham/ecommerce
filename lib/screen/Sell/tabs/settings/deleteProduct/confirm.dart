import 'package:commerce/screen/Sell/tabs/settings/deleteProduct/deleteProduct.dart';
import 'package:flutter/material.dart';

import '../../../../../config.dart';


class Confirm extends StatefulWidget{

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: 300),
          Text("Do You Want To Delete This Product",style: TextStyle(
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
                        builder: (ctx) => DeleteProduct(),
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
                        builder: (ctx) => DeleteProduct(),
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