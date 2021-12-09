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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.user.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(widget.user.age.toString() + ' years old',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black54)),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.user.address.toString(),
            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black54),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: Text(
            widget.user.description,
          ),
        ),
      ],
    );
  }
}
