import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/start/start.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/signIn/component/body.dart';
class SignInScreen extends StatefulWidget {
  static String routeName='/signin';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => start(),
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
