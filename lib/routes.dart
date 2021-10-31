import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:commerce/screen/Search/Search.dart';
import 'package:commerce/screen/signIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:commerce/screen/start/start.dart';
import 'package:commerce/screen/Home/homeScreen.dart';
import 'package:commerce/screen/detailProduct/detailProductScreen.dart';
final Map<String,WidgetBuilder>routes={
  start.routeName:(context)=>start(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  homeScreen.routeName:(context)=>homeScreen(),
  DetailProduct.routeName:(context)=>DetailProduct(),
  CartScreen.routeName:(context)=>CartScreen(),
  SearchScreen.routeName:(context)=>SearchScreen(),
};