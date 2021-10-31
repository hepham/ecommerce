import 'package:flutter/material.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class productDecription extends StatefulWidget {
  const productDecription({Key? key, required this.product, this.pressOneMore})
      : super(key: key);
  final Product product;
  final GestureTapCallback? pressOneMore;

  @override
  State<productDecription> createState() => _productDecriptionState();
}

class _productDecriptionState extends State<productDecription> {
  int index = 2;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
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
