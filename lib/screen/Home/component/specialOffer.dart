import 'package:commerce/screen/Home/component/Section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
class specialOffers extends StatelessWidget {
  const specialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth((20))),
            child: Section(
              title: 'Recommend for you',
              press: (){},
            ),
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              card(category: 'Techology', image: 'assets/images/iphone13.jpg', numbrands: 20, press: (){}),
              card(category: 'Techology', image: 'assets/images/iphone13.jpg', numbrands: 20, press: (){}),
              card(category: 'Techology', image: 'assets/images/iphone13.jpg', numbrands: 20, press: (){}),
              card(category: 'Techology', image: 'assets/images/iphone13.jpg', numbrands: 20, press: (){}),
            ],
          ),

        ),

      ],
    );
  }
}

class card extends StatelessWidget {
  const card({Key? key,required this.category,required this.image,required this.numbrands, required this.press}) : super(key: key);
final String category,image;
final int numbrands;
final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: GestureDetector(
          onTap: press,
          child: SizedBox(
            width: getProportionateScreenWidth(200) ,
            height: getProportionateScreenWidth(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(image,fit: BoxFit.cover,),
                  Container(decoration: BoxDecoration(


                    ),

                  )],
              ),
            ),
          ),
        ),
    );
  }
}
