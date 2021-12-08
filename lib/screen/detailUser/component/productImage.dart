import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/user.dart';

class productImage extends StatefulWidget {
  const productImage({Key? key, required this.user}) : super(key: key);
  final User user;
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
            tag: widget.user.id.toString(),
            child: Image.asset(widget.user.images[selectedImage]),
          ),
        ),

      ],
    );
  }
}
