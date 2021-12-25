import 'package:commerce/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/signIn/SignInScreen.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Text('ECOMMERCE',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      )),
                  Spacer(),
                  Text(
                    'Welcome,shop and bring it to home. Let`s start',
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/splash.png",
                    height: getProportionateScreenHeight(256),
                    width: getProportionateScreenWidth(256),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                          onPressed: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                            setState(() {
                            });
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
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
