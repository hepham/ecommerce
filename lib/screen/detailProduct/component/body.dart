import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/detailProduct/component/color.dart';
import 'package:commerce/screen/detailProduct/component/productImage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/screen/detailProduct/component/description.dart';
import 'package:commerce/config.dart';
import 'package:commerce/component/Button.dart';
import 'package:commerce/models/cart.dart';
class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //hien thi anh product

        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(30)),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: productImage(product: product),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),

        //description product

        productDecription(product: product),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),

        //hien thi màu
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: color(product: product),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),


        //button add cart
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Row(
            children: [

              Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.2,
                  right: SizeConfig.screenWidth * 0.2,
                  bottom: getProportionateScreenWidth(15),
                  top: getProportionateScreenWidth(15),
                ),
                child: Button(
                  text: 'Add to Cart',
                  press: () {
                     demoCart.add( cart(product: product, numOfItems: temp));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
