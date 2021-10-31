import 'package:commerce/models/product.dart';
import 'package:flutter/cupertino.dart';

class cart{
  final Product product;
  final int numOfItems;
  cart({required this.product,required this.numOfItems});

}
List<cart>demoCart=[
  cart(product: demoProducts[0], numOfItems: 10),
  cart(product: demoProducts[0], numOfItems: 10),
  cart(product: demoProducts[0], numOfItems: 10),
  cart(product: demoProducts[0], numOfItems: 10),

];