import 'package:commerce/api/Order_Service.dart';
import 'package:commerce/component/Button.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/models/oderRequest.dart';
import 'package:commerce/models/orderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:commerce/config.dart';

class OrderCheck extends StatefulWidget {
  const OrderCheck({Key? key}) : super(key: key);


  @override
  State<OrderCheck> createState() => _OrderCheckState();
}

class _OrderCheckState extends State<OrderCheck> {

  int Sumcart(List<cart> CartList){
    int T=0;
    for(int i=0;i<CartList.length;i++){
      T=T+CartList[i].product.price*CartList[i].numOfItems;
    }
    return T;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("We will call to confirm your cart"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward,
                  size: 12,
                  color: Colors.redAccent,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text.rich(
                //   TextSpan(
                //     text: "Total:\n",
                //     children: [
                //       TextSpan(
                //         text: "\$ ${Sumcart(demoCart)}",
                //         style: TextStyle(fontSize: 16, color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  width: getProportionateScreenWidth(300),
                  child: Button(
                    text: "Update",
                    press: () {
                      // for(int i=0;i<demoCart.length;i++){
                      //   OrderRequest orderRequest=new OrderRequest(userIdBuy: user.id, productId: demoCart[i].product.id, quantity: demoCart[i].numOfItems, isCompleted: false, userIdSell: demoCart[i].product.user_id);
                      //   Order_Service orderService=new Order_Service();
                      //   orderService.Order(orderRequest).then((value){
                      //     print(value.status);
                      //   });
                      // }

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
