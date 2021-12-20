import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/screen/chat/messageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class productDecription extends StatefulWidget {
  const productDecription({Key? key, required this.product, this.pressOneMore})
      : super(key: key);
  final newProduct product;
  final GestureTapCallback? pressOneMore;

  @override
  State<productDecription> createState() => _productDecriptionState();
}

class _productDecriptionState extends State<productDecription> {
  bool isMore = false;
  int index = 2;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.product.isFavourite = !widget.product.isFavourite;
              });
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(50),
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

        ),
        Positioned(
          top: 60.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, ChatScreen.routeName);
              });
            },
            child: Align(
              alignment: Alignment.centerRight,

              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                  color:  Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/Mail.svg",
                  color:  Color(0xFFFF4848),
                  height: getProportionateScreenWidth(16),
                ),
              ),
            ),
          ),

        ),
        Column(
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

          // hien thi mieu ta san pham

          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(64),
                bottom: 50,
            ),
            child: isMore
                ? Text(
                    widget.product.description,

                  )
                : Text(
                    widget.product.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              isMore = !isMore;
            }),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(64)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    isMore ? "View Less" : "View More",
                    style: TextStyle(color: Colors.redAccent, fontSize: 10.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
