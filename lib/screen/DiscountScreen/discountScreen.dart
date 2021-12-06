import 'package:commerce/screen/DiscountScreen/discountField.dart';
import 'package:flutter/material.dart';

class discountScreen extends StatelessWidget {
  static String routeName = '/discount';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: discountField(),
    );
  }
}
