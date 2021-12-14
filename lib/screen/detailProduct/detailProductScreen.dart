import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/screen/detailProduct/component/body.dart';
import 'package:commerce/screen/detailProduct/component/color.dart';
import 'package:flutter/material.dart';
import 'package:commerce/models/product.dart';

import '../../enums.dart';
class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);
  static String routeName='/details';
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args=  ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      //xem kĩ ở body trong component
      body: Body(product: args.NewProduct ,),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.none),
    );
  }
}
class ProductDetailsArguments {
  final newProduct NewProduct;

  ProductDetailsArguments({required this.NewProduct});
}