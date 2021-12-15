import 'package:commerce/models/product.dart';
import 'package:commerce/screen/Home/component/productCard.dart';
import 'package:commerce/screen/Home/component/search.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Search/component/searchField.dart';



class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchField(),
            // ProductCard(product: demoProducts,),
          ],
        ),
      ),
    );
  }
}
