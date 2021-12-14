// import 'package:flutter/material.dart';
//
// class Product {
//   final int id;
//   final String title, description,type;
//   final List<String> images;
//   final List<Color> colors;
//   final double  price;
//   bool isFavourite, isPopular;
//
//   Product({
//     required this.id,
//     required this.type,
//     required this.images,
//     required this.colors,
//     this.isFavourite = false,
//     this.isPopular = false,
//     required this.title,
//     required this.price,
//     required this.description,
//   });
// }
// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),Product(
//     id: 1,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 5,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 6,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 7,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: false,
//     isPopular: false,
//   ),
//
//
//   Product(
//     id: 8,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.jpg",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 9,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.jpg",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 10,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//       "assets/images/iphone13a.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),Product(
//     id: 11,
//     type:'techology',
//     images: [
//       "assets/images/iphone13product.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Iphone 13 Pro Max",
//     price: 1300,
//     description: description,
//     isFavourite: true,
//     isPopular: true,
//   ),
//
//
// ];
//
// List<Product> searchQuery(String? searchText) {
//   return demoProducts.
//     where((element) =>
//       element.title.toLowerCase().contains(searchText!)).toList();
// }
// const String description =
//     'The iPhone 13 and 13 Mini received a number of significant upgrades including new cameras, a bigger battery, more storage and a brighter screen. The iPhone 13 is a delightful upgrade to last year`s already wonderful iPhone 12 family. Some will be disappointed because it`s not radically different from previous models, but that`s actually part of the charm. Familiarity has been one of the keys to Apple`s success with the iPhone, and the iPhone 13 and 13 Mini are those same reliable friends that seemingly never change.';