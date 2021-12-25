import 'package:commerce/screen/signIn/SignInScreen.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class ForgotPassword extends StatefulWidget{

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
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
        ),

      ),
      body: Body(),
    );
  }
}