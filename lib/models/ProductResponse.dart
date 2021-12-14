// To parse required required this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);

import 'dart:convert';
import 'dart:typed_data';
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

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
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
    required this.images,
    required this.colors,
    required this.price,
    required this.type,
    required this.isFavourite,
    required this.isPopular,
    required this.description,
    required this.user_id,
  });

  final int id;
  final String title_Name;
  final String images;
  final String colors;
  final int price;
  final String type;
  bool isFavourite;
  bool isPopular;
  final String description;
  final int user_id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title_Name: json['title_name'],
    images: json['images'],
    colors: json['colors'],

    price: json['price'],
    type: json['type'],
    isFavourite: json['isFavourite'],
    isPopular: json['isPopular'],
    description: json['description'],
    user_id: json['user_id'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_name': title_Name,
    'images': images,
    'colors': colors,
    'price': price,
    'type': type,
    'isFavourite': isFavourite,
    'isPopular': isPopular,
    'description': description,
    'user_id': user_id,
  };
}
List<Product>demoProducts=[
Product(
    id: 1,
    type:'techology',
    images: "assets/images/iphone13product.png",
    colors: 'Oxcskaj',
    title_Name: "Iphone 13 Pro Max",
    price: 1300,
    description: 'description',

    isFavourite: true,
    isPopular: true,
  user_id: 2,
  ),

];
List<Product> searchQuery(String? searchText) {
  return demoProducts.
    where((element) =>
      element.title_Name.toLowerCase().contains(searchText!)).toList();
}

class newProduct {
  final int id;
  final String title_name, description,type;
  final List<String> images;
  final List<Color> colors;
  final int  price;
  bool isFavourite, isPopular;

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
  });
}
newProduct convert(Product product){
  // print(product.images);
  List<String> listImage=product.images.split('|');
  List<Color>listColor=[];
  List<String> listColorstring=product.colors.split('|');

  for(int i=0;i<listColorstring.length;i++){
    Color newColor = new Color(int.parse(listColorstring[i]));
    listColor.add(newColor);
  }
  newProduct temp=newProduct(id: product.id, type: product.type, images:listImage, colors: listColor, title_name: product.title_Name, price: product.price, description: product.description);

  return temp;
}
List<newProduct>convertList(List<Product>products){
  List<newProduct> ListNewProduct=[];
  for(int i=0;i<products.length;i++){
    newProduct tempt=convert(products[i]);
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
