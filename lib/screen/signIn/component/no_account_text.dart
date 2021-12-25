import 'package:commerce/screen/signUp/SignUpScreen.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../constants.dart';

class NoAccountText extends StatefulWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  State<NoAccountText> createState() => _NoAccountTextState();
}

class _NoAccountTextState extends State<NoAccountText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(

          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => SignUpScreen(),
              ),
            );
            setState(() {

            });
          },
        ),
      ],
    );
  }
}