import 'package:flutter/material.dart';
import 'package:commerce/screen/signIn/component/body.dart';
class SignInScreen extends StatelessWidget {
  static String routeName='/signin';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
