import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/screen/Home/component/Discount.dart';
import 'package:commerce/screen/Home/component/home_header.dart';
import 'package:commerce/screen/Home/component/productCard.dart';
import 'package:commerce/screen/Home/component/specialOffer.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Home/component/search.dart';
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
    final products=await ProductApi.GetProduct();
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

              SizedBox(height: getProportionateScreenHeight(20),),
              homeHeader(),
              Discount(),
              specialOffers(),

               ProductCard(products: ListProducts,),
            ],
          ),
        )
        );
  }
}
