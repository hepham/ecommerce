import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/screen/Sell/tabs/MyShop/addProduct/new_product_images.dart';
import 'package:commerce/screen/Sell/tabs/MyShop/myshop.dart';
import 'package:commerce/screen/profile/tabs/settings.dart';
import 'package:flutter/material.dart';

import '../../../../../config.dart';

String name = "";
String description = "";
String type = "";
String price = "";


class NewProductInfo extends StatefulWidget {
  @override
  State<NewProductInfo> createState() => _NewProductInfoState();
}

class _NewProductInfoState extends State<NewProductInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("New Product Information",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => NewProductImage(),
              ),
            );
            setState(() {

            });
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter New Product Name",
                    labelText: "Product Name",
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Describe Your New Product",
                    labelText: "Product Detail",
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Type Of Product",
                    labelText: "Product Type",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      price = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "New Product Price",
                    labelText: "Product Price",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: 200,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    newProductInstance.title_name = name;
                    newProductInstance.description = description;
                    newProductInstance.type = type;
                    var priceInt = int.parse(price);
                    assert(priceInt is int);
                    newProductInstance.price = priceInt;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => MyShop(),
                      ),
                    );
                    setState(() {

                    });
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
