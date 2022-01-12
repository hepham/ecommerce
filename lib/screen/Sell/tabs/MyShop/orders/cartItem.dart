import 'dart:convert';

import 'package:commerce/api/User_Service.dart';
import 'package:commerce/component/RoundBtn.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/cart.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.Cart}) : super(key: key);
  final cart Cart;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  Data customer = new Data(
      id: 0,
      username: "waitting...",
      gmail:  "waitting...",
      phone:  "waitting...",
      password:  "waitting...",
      address:  "waitting...",
      age: 0,
      isSeller: true,
      description:  "waitting...",
      images:  "waitting...",);
  void initState() {
    super.initState();
    this.init();
  }

  Future init() async {
    print(widget.Cart.IdBuy);
    print(widget.Cart.idOrder);
    final tempt = await User_Service.GetUserbyId(widget.Cart.IdBuy);
    print(tempt.username.toString());
    if (mounted)
      setState(() {
        this.customer = tempt;
        // print(customer.username);
        // print(customer.address);
      });
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Người mua: " + customer.username,
              style: TextStyle(color: Colors.black, fontSize: 20),
              maxLines: 2,
            ),
            Text.rich(
              TextSpan(
                text: "SDT: " + customer.phone,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.withOpacity(0.7),
                ),
                children: [

                  TextSpan(
                    text: "\n Địa chỉ: " + customer.address,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ],
        ),


        Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    Image.memory(base64Decode(widget.Cart.product.images[0])),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.Cart.product.title_name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: '\$${widget.Cart.product.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent.withOpacity(0.7),
                    ),
                    children: [
                      TextSpan(
                        text: 'x${widget.Cart.numOfItems}',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
