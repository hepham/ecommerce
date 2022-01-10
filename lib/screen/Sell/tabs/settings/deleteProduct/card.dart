import 'dart:convert';

import 'package:commerce/api/User_Service.dart';
import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/Sell/tabs/settings/deleteProduct/confirm.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/screen/detailProduct/detailProductScreen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class card extends StatefulWidget {
  const card({
    Key? key,
    required this.product,
  }) : super(key: key);
  final newProduct product;

  @override
  State<card> createState() => _cardState();
}
int temp1=0;
class _cardState extends State<card> {
  Data customer = new Data(
    id: 0,
    username: "waitting...",
    gmail:  "waitting...",
    phone:  "waitting...",
    password:  "waitting...",
    address:  "waitting...",
    age: 0,
    isSeller: true,
    description:  "waitting...",
    images:  "waitting...",);
  void initState() {
    super.initState();
    this.init();
  }

  Future init() async {
    print(widget.product.user_id);
    final tempt = await User_Service.GetUserbyId(widget.product.user_id);
    if (mounted)
      setState(() {
        this.customer = tempt;
        print(customer.username);
        print(customer.address);
      });
  }

  @override

  Widget build(BuildContext context) {
    return Container(

      child: Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(10),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(20),
              getProportionateScreenWidth(10)),
          child: SizedBox(
              width: getProportionateScreenWidth(145),
              child: GestureDetector(
                onTap: () {

                  print(temp1);
                  Navigator.pushNamed(
                    context,
                    DetailProduct.routeName,
                    arguments: ProductDetailsArguments(NewProduct:widget.product),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    AspectRatio(
                      aspectRatio: 1.2,
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Hero(
                          tag: widget.product.id.toString(),
                          child:  Image.memory(base64Decode(widget.product.images[0]),fit: BoxFit.cover,alignment:Alignment.center,),
                        ),
                      ),
                    ),
                    // Container(
                    //   loadImage(),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.product.title_name}',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${widget.product.price}',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent,
                            )),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Confirm(),
                              ),
                            );
                            setState(() {
                            });
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(28),
                            width: getProportionateScreenWidth(28),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Trash.svg',
                              color:Color(0xFFFF4848),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      customer.username,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
