import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/product.dart';

class productImage extends StatefulWidget {
  const productImage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _productImageState createState() => _productImageState();
}

class _productImageState extends State<productImage> {
  @override
  int selectedImage = 0;
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(300),
          child:Hero(
            tag: widget.product.id.toString(),
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),

      ],
    );
  }
}
