
import 'package:commerce/api/User_Service.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/profile/tabs/settings.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

bool obserText1 = true;
bool obserText2 = true;
bool obserText3 = true;
String pw = "";
String password = "";
bool checkpass = true;

class ChangePassword extends StatefulWidget {

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text("Your New Password Don't Match"));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
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
                builder: (ctx) => Settings(),
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
                  obscureText: obserText1,
                  decoration: InputDecoration(
                    hintText: "Enter your current password",
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obserText1 = !obserText1;
                        });
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(
                        obserText1 == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      pw = value;
                    });
                  },
                  obscureText: obserText2,
                  decoration: InputDecoration(
                    hintText: "Fill your new password",
                    labelText: "New Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obserText2 = !obserText2;
                        });
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(
                        obserText2 == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (value) {
                    if (checkpass == false) {
                      return "Your text don't match";
                    } else
                      return "";
                  },
                  obscureText: obserText3,
                  decoration: InputDecoration(
                    hintText: "Refill your new password",
                    labelText: "Confirm New Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obserText3 = !obserText3;
                        });
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(
                        obserText3 == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
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
                    if(password != pw){
                      checkpass = false;
                      _displaySnackBar(context);
                    }
                    else {
                      user.password=password;
                      User_Service.UserUpdate(user);
                      print(password);
                      checkpass = true;
                      Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Settings(),
                      ),
                    );}
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

