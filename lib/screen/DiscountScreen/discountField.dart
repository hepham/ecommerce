
import 'package:commerce/component/component.dart';
import 'package:commerce/models/product.dart';
import 'package:flutter/material.dart';



class discountField extends StatelessWidget {
  const discountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            for(int i=0;i<demoProducts.length-1;i+=2)
              Row(
                children: [
                  card(product: demoProducts[i]),
                  card(product: demoProducts[i+1]),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

