import 'package:commerce/models/user.dart';
import 'package:flutter/material.dart';

import 'package:commerce/config.dart';

class userDecription extends StatefulWidget {
  const userDecription({Key? key, required this.user, this.pressOneMore})
      : super(key: key);
  final User user;
  final GestureTapCallback? pressOneMore;

  @override
  State<userDecription> createState() => _userDecriptionState();
}

class _userDecriptionState extends State<userDecription> {
  int index = 2;
  bool check = false;
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
            widget.user.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),

        //hien thi gia san pham

        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: Text(
            widget.user.description,
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
                index = widget.user.description.length;
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
