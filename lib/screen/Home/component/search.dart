import 'package:commerce/config.dart';
import 'package:flutter/material.dart';
import 'package:commerce/screen/Search/searchScreen.dart';
class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular((20)),
      ),
      child: TextField(
        showCursor: true,
        readOnly: true,
        onTap: ()=>Navigator.pushNamed(
          context,
          searchScreen.routeName,
        ),
        onChanged: (value) {
        },

        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),),
        ),
      ),
    );
  }

}