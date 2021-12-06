import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/component/component.dart';
import 'package:commerce/models/product.dart';

import 'package:commerce/screen/Search/component/searchField.dart';

import '../../../config.dart';
import 'section.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key,required this.product}) : super(key: key);
  final List<Product>product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0;i<product.length-1;i+=2)
        Row(
          children: [
            card(product: product[i]),
            card(product: product[i+1]),
          ],
        ),
      ],
    );
  }
}
