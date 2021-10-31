import 'package:flutter/material.dart';
import 'package:commerce/config.dart';

class RoundBtn extends StatelessWidget {
  const RoundBtn(
      {Key? key,
      required this.icon,
      required this.press,
      this.showShadow = false})
      : super(key: key);
  final IconData icon;
  final GestureTapCallback press;
  final bool showShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(30),
      width: getProportionateScreenWidth(30),
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        if (showShadow)
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.1),
          )
      ]),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
