import 'dart:convert';

import 'package:commerce/component/RoundBtn.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/cart.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.Cart}) : super(key: key);
  final cart Cart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.memory(base64Decode(widget.Cart.product.images[0])),
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
                  ]),
            ),

          ],
        ),
        Spacer(),
        RoundBtn(
          icon: Icons.remove,
          press: () {
            setState(() {
              if (widget.Cart.numOfItems == 1)
                widget.Cart.numOfItems = widget.Cart.numOfItems;
              else
                widget.Cart.numOfItems = widget.Cart.numOfItems-1;

              print(  widget.Cart.numOfItems);
            });

          },
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text('${  widget.Cart.numOfItems}',

        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        RoundBtn(
          icon: Icons.add,
          press: () {
            setState(() {
              widget.Cart.numOfItems = widget.Cart.numOfItems+1;
              // print(widget.Cart.numOfItems);
            });
          },
          showShadow: true,
        ),
      ],
    );
  }
}
