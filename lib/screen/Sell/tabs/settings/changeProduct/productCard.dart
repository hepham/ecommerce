import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Sell/tabs/settings/changeProduct/card.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key,required this.products}) : super(key: key);
  final List<newProduct>products;
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: <Widget>[
    //     for(int i=0;i<products.length-1;i+=2)
    //     Row(
    //       children: [
    //         card(product: products[i]),
    //         card(product: products[i+1]),
    //       ],
    //     ),
    //   ],
    // );
    return Container(
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 4/5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, index) {
            return card(product: products[index]);
          }),
    );

  }
}
