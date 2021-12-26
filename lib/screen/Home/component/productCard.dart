import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/component/component.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key,required this.products}) : super(key: key);
  final List<newProduct>products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for(int i=0;i<products.length-1;i+=2)
        Row(
          children: [
            card(product: products[i]),
            card(product: products[i+1]),
          ],
        ),
      ],
    );
    // return GridView.count(crossAxisCount: 2,
    // children: List.generate(products.length, (index) {
    //   return card(product: products[index]);
    // }),
    // );
    
  }
}
