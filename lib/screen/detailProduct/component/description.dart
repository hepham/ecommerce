import 'dart:convert';
import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
class productDecription extends StatefulWidget {
  const productDecription({Key? key, required this.product, this.pressOneMore})
      : super(key: key);
  final newProduct product;
  final GestureTapCallback? pressOneMore;
  @override
  State<productDecription> createState() => _productDecriptionState();
}
class _productDecriptionState extends State<productDecription> {
  int index = 2;
  bool check = false;
  postData()async{
    final url=Uri.parse('https://2e49-2405-4803-fde0-8830-1472-1c18-fc88-9e21.ngrok.io/api/products/update');
    Product temp=convertToProduct(widget.product);
    print(json.encode(temp.toJson()));
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(temp.toJson()),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Update failed.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //hien thi tieu de san pham bạn thêm cái row ở đây để chèn cái icon message kìa

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title_name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),

        //hien thi gia san pham


        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.price.toString(),
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.product.isFavourite = !widget.product.isFavourite;
              postData();

            });
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(64),
              decoration: BoxDecoration(
                color: widget.product.isFavourite
                    ? Color(0xFFFFE6E6)
                    : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                color: widget.product.isFavourite
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
                height: getProportionateScreenWidth(16),
              ),
            ),
          ),
        ),

        //hien thi mô ta sản phẩm

        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: Text(
            widget.product.description,
            maxLines: index,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: GestureDetector(
            onTap: () {
              setState(() {
                index = widget.product.description.length;
              });
            },
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
