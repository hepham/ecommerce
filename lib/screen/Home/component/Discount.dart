import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:commerce/screen/DiscountScreen/discountScreen.dart';
class Discount extends StatelessWidget {
  const Discount({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(
        context,
        discountScreen.routeName,
    ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
              style: TextStyle(color: Colors.white),
              children: [

                TextSpan(text: 'Super Sale Black Friday\n'),
                TextSpan(text: 'Discount 30%',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                )),

              ]
            ),),
            SvgPicture.asset('assets/icons/shopping.svg',
            height: getProportionateScreenWidth(50),  ),
          ],
        ),
      ),
    );
  }
}
