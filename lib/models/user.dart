import 'package:commerce/screen/profile/tabs/myaccount.dart';
import 'package:flutter/material.dart';

class User {
  final int id;
  final String title, description,type;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  User({
    required this.id,
    required this.type,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}
List<User> demoUser = [
  User(
    id: 1,
    type:'techology',
    images: [
      "assets/images/avatar.jpg",
      "assets/images/iphone13a.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: userName,
    price: 1300,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),


];

List<User> searchQuery(String? searchText) {
  return demoUser.
  where((element) =>
      element.title.toLowerCase().contains(searchText!)).toList();
}
const String description =
    'The iPhone 13 and 13 Mini received a number of significant upgrades including new cameras, a bigger battery, more storage and a brighter screen. The iPhone 13 is a delightful upgrade to last year`s already wonderful iPhone 12 family. Some will be disappointed because it`s not radically different from previous models, but that`s actually part of the charm. Familiarity has been one of the keys to Apple`s success with the iPhone, and the iPhone 13 and 13 Mini are those same reliable friends that seemingly never change.';