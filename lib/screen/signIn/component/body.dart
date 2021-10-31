import 'package:commerce/config.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Text(
            'Welcome Back',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
            ),
          ),
          Text(
            'Sign in to your account',
            textAlign: TextAlign.center,
          ),
          Spacer(),
          SignForm(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, homeScreen.routeName);
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  )),
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    ));
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your email or phone number",
              labelText: "Email",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your passWord",
              labelText: "password",
            ),
          ),
        ],
      ),
    ));
  }
}
