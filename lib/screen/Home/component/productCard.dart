import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/component/component.dart';
import 'package:commerce/models/product.dart';

import 'package:commerce/screen/Search/component/searchField.dart';

import '../../../config.dart';
import 'section.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key,required this.products}) : super(key: key);
  final List<newProduct>products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0;i<products.length-1;i+=2)
        Row(
          children: [
            card(product: products[i]),
            card(product: products[i+1]),
          ],
        ),
      ],
    );
  }
}
