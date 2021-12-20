import 'dart:convert';

import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';

class productImage extends StatefulWidget {
  const productImage({Key? key, required this.product}) : super(key: key);
  final newProduct product;
  @override
  _productImageState createState() => _productImageState();
}

class _productImageState extends State<productImage> {

  int selectedImage = 0;
  @override

  Widget build(BuildContext context) {
    //trong phần này bạn xử lí scroll ngang để nó sang ảnh khác nhé, xử lí cả nếu là video nữa
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(300),
          child:Hero(
            tag: widget.product.id.toString(),
            child: Image.memory(base64Decode(widget.product.images[selectedImage])),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )

      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Color(0xFFFF7643).withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.memory(base64Decode(widget.product.images[index])),
      ),
    );
  }
}
