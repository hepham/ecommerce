import 'package:commerce/config.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/screen/Home/component/Discount.dart';
import 'package:commerce/screen/Home/component/home_header.dart';
import 'package:commerce/screen/Home/component/productCard.dart';
import 'package:commerce/screen/Home/component/specialOffer.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Home/component/search.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: getProportionateScreenHeight(20),),
              homeHeader(),
              Discount(),
              specialOffers(),
              ProductCard(product: demoProducts,),
            ],
          ),
        ) );
  }
}
