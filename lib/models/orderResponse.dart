// To parse required this JSON data, do
//
//     final orderResponse = orderResponseFromMap(jsonString);

import 'dart:convert';



class OrderResponse {
  OrderResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final Data data;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toMap() => {
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
