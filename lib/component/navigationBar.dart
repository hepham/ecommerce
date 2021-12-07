import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:commerce/enums.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key, required this.selectedMenu}) : super(key: key);
  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, homeScreen.routeName),
              icon: SvgPicture.asset(
                'assets/icons/Home.svg',
                color: MenuState.home == selectedMenu
                    ? Color(0xFFFF7643)
                    : Color(0xFFB6B6B6),
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, homeScreen.routeName),
              icon: SvgPicture.asset(
                'assets/icons/Mail.svg',
                color: MenuState.message == selectedMenu
                    ? Color(0xFFFF7643)
                    : Color(0xFFB6B6B6),
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CartScreen.routeName),
              icon: SvgPicture.asset(
                'assets/icons/Cart.svg',
                color: MenuState.cart == selectedMenu
                    ? Color(0xFFFF7643)
                    : Color(0xFFB6B6B6),
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
              icon: SvgPicture.asset(
                'assets/icons/User.svg',
                color: MenuState.profile == selectedMenu
                    ? Color(0xFFFF7643)
                    : Color(0xFFB6B6B6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
