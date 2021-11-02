import 'package:flutter/material.dart';
import 'package:commerce/models/product.dart';
import 'package:commerce/config.dart';
import 'package:commerce/screen/detailProduct/detailProductScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class card extends StatefulWidget {
  const card({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<card> createState() => _cardState();
}
int temp1=0;
class _cardState extends State<card> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(20),
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
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // width: getProportionateScreenWidth(160),
                      // height: getProportionateScreenWidth(160),
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Image.asset(
                              widget.product.images[0],
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.product.title}',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.product.price}',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent,
                            )),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            setState(() {
                              widget.product.isFavourite =
                                  !widget.product.isFavourite;
                            });
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(28),
                            width: getProportionateScreenWidth(28),
                            decoration: BoxDecoration(
                              color: widget.product.isFavourite
                                  ? Colors.redAccent.withOpacity(0.15)
                                  : Colors.grey.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Heart.svg',
                              color: widget.product.isFavourite
                                  ? Color(0xFFFF4848)
                                  : Color(0xFFDBDEE4),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
