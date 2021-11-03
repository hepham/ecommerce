import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/component/component.dart';
import 'package:commerce/models/product.dart';

import '../../../config.dart';
import 'section.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key,required this.product}) : super(key: key);
  final List<Product>product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=0;i<widget.product.length-1;i=i+2)
        Row(
          children: [
              card(product: widget.product[i]),
              card(product: widget.product[i+1]),
          ],
        ),

      ],
    );
  }
}
