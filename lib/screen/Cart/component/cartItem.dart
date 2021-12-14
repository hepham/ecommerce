import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.Cart}) : super(key: key);
  final cart Cart;
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
            child: Image.asset(Cart.product.images[0]),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Cart.product.title_name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: '\$${Cart.product.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent.withOpacity(0.7),
                ),
                children: [
                  TextSpan(
                    text: 'x${Cart.numOfItems}',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ]))
          ],
        )
      ],
    );
  }
}
