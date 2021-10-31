import 'package:commerce/models/product.dart';
import 'package:commerce/screen/Home/component/productCard.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Search/component/searchheader.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
        child: Column(
          children: [
            SearchField(),
            ProductCard(product: demoProducts,),
          ],
        ),
        ),
    );
  }
}
