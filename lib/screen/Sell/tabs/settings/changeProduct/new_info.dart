import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/Sell/tabs/settings/addProduct/new_product_images.dart';
import 'package:commerce/screen/Sell/tabs/MyShop/myshop.dart';
import 'package:commerce/screen/Sell/tabs/settings/changeProduct/changeProduct.dart';

import 'package:flutter/material.dart';

import '../../../../../../config.dart';

String name = "";
String description = "";
String type = "";
String price = "";
String colors = "";
List<Color> listColor = [];
List<String> listColorstring=[];

class NewInfo extends StatefulWidget {
  @override
  State<NewInfo> createState() => _NewInfoState();
}

class _NewInfoState extends State<NewInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          "New Information",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => ChangeProduct(),
              ),
            );
            setState(() {});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        colors = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Describe Your Product Colors",
                      labelText: "Colors form:#151026|#151026",
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
                      newProductInstance.user_id = user.id;
                      newProductInstance.title_name = name;
                      newProductInstance.description = description;
                      newProductInstance.type = type;
                      var priceInt = int.parse(price);
                      assert(priceInt is int);
                      newProductInstance.price = priceInt;
                      listColorstring=colors.split('|');;
                      listColor = [];
                      for (int i = 0; i < listColorstring.length; i++) {
                        print(listColorstring[i].toString());
                        Color newColor = HexColor.fromHex(listColorstring[i]);
                        listColor.add(newColor);

                      }
                      newProductInstance.colors=listColor;
                      ProductApi.createProduct(newProductInstance);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ChangeProduct(),
                        ),
                      );
                      setState(() {});
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
      ),
    );
  }
}
