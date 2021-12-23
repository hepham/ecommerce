import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:commerce/screen/Search/searchScreen.dart';
import 'package:commerce/screen/Sell/sell_screen.dart';
import 'package:commerce/screen/chat/chatScreen.dart';
import 'package:commerce/screen/chat/messageScreen.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:commerce/screen/signIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:commerce/screen/start/start.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/detailProduct/detailProductScreen.dart';
import 'package:commerce/screen/DiscountScreen/discountScreen.dart';

import 'models/cart.dart';
final Map<String,WidgetBuilder>routes={
  start.routeName:(context)=>start(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  homeScreen.routeName:(context)=>homeScreen(),
  DetailProduct.routeName:(context)=>DetailProduct(),
  CartScreen.routeName:(context)=>CartScreen(),
  searchScreen.routeName:(context)=>searchScreen(),
  discountScreen.routeName:(context)=>discountScreen(),
  discountScreen.routeName:(context)=>discountScreen(),
  ProfileScreen.routeName:(context)=>ProfileScreen(),
  SellScreen.routeName:(context)=>SellScreen(),
  ChatScreen.routeName:(context)=>ChatScreen(),
  MessageScreen.routeName:(context)=>MessageScreen(),
};