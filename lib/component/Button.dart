import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
class Button extends StatelessWidget {
  const Button({Key? key,this.text,this.press}) : super(key: key);
final String? text;
final Function? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenWidth(80),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: Colors.redAccent.withOpacity(0.9),

        ), onPressed:press as void Function(),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
