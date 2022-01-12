import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/Home/component/productCard.dart';

import 'package:commerce/screen/Sell/tabs/MyShop/orders/Orders.dart';
import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product>Products=[];
  List<newProduct>ListProducts=[];
  bool isLoading=false;
  late Future<ProductResponse> futureProducts;
  void initState(){

    super.initState();
    this.init();
  }
  Future init() async{
    final products=await ProductApi.GetProductBySeller(user.id);
    if(mounted) setState(() {
      this.ListProducts=convertList(products);
      this.Products=products;

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),

              ProfileMenu(
                icon: "assets/icons/User.svg",
                text: "Orders",
                press: () {Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => OrderScreen(),
                  ),
                );
                setState(() {

                });},
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              ProductCard(products: ListProducts,),
            ],
          ),
        )
    );
  }
}
