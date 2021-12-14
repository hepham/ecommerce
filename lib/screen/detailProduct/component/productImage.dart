import 'dart:convert';

import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/product.dart';

class productImage extends StatefulWidget {
  const productImage({Key? key, required this.product}) : super(key: key);
  final newProduct product;
  @override
  _productImageState createState() => _productImageState();
}

class _productImageState extends State<productImage> {
  @override
  int selectedImage = 0;
  Widget build(BuildContext context) {
    //trong phần này bạn xử lí scroll ngang để nó sang ảnh khác nhé, xử lí cả nếu là video nữa
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(300),
          child:Hero(
            tag: widget.product.id.toString(),
            child: Image.memory(base64Decode(widget.product.images[0])),
          ),
        ),

      ],
    );
  }
}
