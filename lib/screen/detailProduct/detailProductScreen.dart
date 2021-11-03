import 'package:commerce/component/navigationBar.dart';
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

    return Scaffold(
      //xem kĩ ở body trong component
      body: Body(product: demoProducts[0] ,),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.none),
    );
  }
}
