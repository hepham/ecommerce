import 'package:commerce/screen/profile/tabs/myaccount.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ChangeUserName extends StatefulWidget {
  @override
  State<ChangeUserName> createState() => _ChangeUserNameState();
}

String userName = "";

class _ChangeUserNameState extends State<ChangeUserName> {
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
                builder: (ctx) => MyAccount(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Change your name",
                    labelText: "User Name",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: 200,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => MyAccount(),
                      ),
                    );
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Confirm",
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
