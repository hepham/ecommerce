// To parse required this JSON data, do
//
//     final productInformResponse = productInformResponseFromJson(jsonString);

import 'dart:convert';

import 'dart:ui';

import 'ProductResponse.dart';



class ProductInformResponse {
  ProductInformResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final Data data;

  factory ProductInformResponse.fromJson(Map<String, dynamic> json) => ProductInformResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.titleName,
    required this.colors,
    required this.price,
    required this.type,
    required this.isFavourite,
    required this.isPopular,
    required this.description,
    required this.userId,
    required this.images,
  });

  final int id;
  final String titleName;
  final String colors;
  final int price;
  final String type;
  final bool isFavourite;
  final bool isPopular;
  final String description;
  final int userId;
  final String images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    titleName: json["title_name"],
    colors: json["colors"],
    price: json["price"],
    type: json["type"],
    isFavourite: json["isFavourite"],
    isPopular: json["isPopular"],
    description: json["description"],
    userId: json["user_id"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_name": titleName,
    "colors": colors,
    "price": price,
    "type": type,
    "isFavourite": isFavourite,
    "isPopular": isPopular,
    "description": description,
    "user_id": userId,
    "images": images,
  };
}

newProduct convertID(Data product) {
  // print(product.images);
  List<String> listImage = product.images.split('|');
  List<Color> listColor = [];
  List<String> listColorstring = product.colors.split('|');
  for (int i = 0; i < listColorstring.length; i++) {
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
      title_name: product.titleName,
      price: product.price,
      description: product.description,
      user_id: product.userId);

  return tempt;
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
