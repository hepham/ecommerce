// To parse required required this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);

import 'dart:convert';
import 'dart:typed_data';
import 'package:commerce/screen/Home/component/Body.dart';
import 'package:flutter/material.dart';

class ProductResponse {
  ProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Product> data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        status: json['status'],
        message: json['message'],
        data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.title_Name,
    required this.colors,
    required this.price,
    required this.type,
    required this.isFavourite,
    required this.isPopular,
    required this.description,
    required this.user_id,
    required this.images,
  });

  int id;
  String title_Name;
  String images;
  String colors;
  int price;
  String type;
  bool isFavourite;
  bool isPopular;
  String description;
  int user_id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title_Name: json['title_name'],
    colors: json['colors'],
    price: json['price'],
    type: json['type'],
    isFavourite: json['isFavourite'],
    isPopular: json['isPopular'],
    description: json['description'],
    user_id: json['user_id'],
    images: json['images'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_name': title_Name,
    'colors': colors,
    'price': price,
    'type': type,
    'isFavourite': isFavourite,
    'isPopular': isPopular,
    'description': description,
    'user_id': user_id,
    'images': images,
  };
}

List<newProduct> demoProducts = [
  newProduct(
    id: 10,
    type: 'techology',
    images: [
      "assets/images/iphone13product.jpg",

    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title_name: "Iphone 13 Pro Max",
    price: 1300,
    description: 'sdksjhkjshk',
    isFavourite: true,
    isPopular: true,
    user_id: 15,
  ),
  newProduct(
    id: 10,
    type: 'techology',
    images: [
      "assets/images/iphone13product.jpg",

    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title_name: "Iphone 13 Pro Max",
    price: 1300,
    description: 'sdksjhkjshk',
    isFavourite: true,
    isPopular: true,
    user_id: 15,
  ),
];
List<newProduct> searchQuery(String? searchText) {
  return ListProducts
      .where(
          (element) => element.title_name.toLowerCase().contains(searchText!))
      .toList();
}

class newProduct {
  int id;
  String title_name, description, type;
  List<String> images;
  List<Color> colors;
  int price;
  bool isFavourite, isPopular;
  int user_id;

  newProduct({
    required this.id,
    required this.type,
    required this.images,
    required this.colors,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title_name,
    required this.price,
    required this.description,
    required this.user_id,
  });
}

newProduct newProductInstance = newProduct(
    id: -1,
    type: '',
    images: [],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
    ],
    title_name: '',
    price: -1,
    description: '',
    user_id: -1);

newProduct convert(Product product) {
  // print(product.images);
  List<String> listImage = product.images.split('|');
  List<Color> listColor = [];
  List<String> listColorstring = product.colors.split('|');
  for (int i = 0; i < listColorstring.length; i++) {
    print(listColorstring[i].toString());
    Color newColor = HexColor.fromHex(listColorstring[i]);
    listColor.add(newColor);
  }

  newProduct tempt = newProduct(
      id: product.id,
      type: product.type,
      images: listImage,
      colors: listColor,
      isFavourite: product.isFavourite,
      isPopular: product.isPopular,
      title_name: product.title_Name,
      price: product.price,
      description: product.description,
      user_id: product.user_id);

  return tempt;
}

Product convertToProduct(newProduct newProduct) {
  String tempImage = '';
  for (int i = 0; i < newProduct.images.length; i++) {
    tempImage = tempImage + newProduct.images[i];
    if (i < newProduct.images.length - 1) {
      tempImage = tempImage + '|';
    }
  }
  String temptColor = '';
  for (int i = 0; i < newProduct.colors.length; i++) {
    temptColor = temptColor + newProduct.colors[i].toHex();
    print(newProduct.colors[i].value.toString());
    if (i < newProduct.colors.length - 1) {
      temptColor = temptColor + '|';
    }
  }
  Product product = Product(
    id: newProduct.id,
    title_Name: newProduct.title_name,
    images: tempImage,
    colors: temptColor,
    price: newProduct.price,
    type: newProduct.type,
    isFavourite: newProduct.isFavourite,
    isPopular: newProduct.isPopular,
    description: newProduct.description,
    user_id: newProduct.user_id,
  );
  return product;
}

List<newProduct> convertList(List<Product> products) {
  List<newProduct> ListNewProduct = [];
  for (int i = 0; i < products.length; i++) {
    newProduct tempt = convert(products[i]);
    ListNewProduct.add(tempt);
  }
  return ListNewProduct;
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

Image imageFromBase64String(String base64String) {
  return Image.memory(
    base64Decode(base64String),
    fit: BoxFit.cover,
  );
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
