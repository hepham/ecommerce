// To parse required this JSON data, do
//
//     final cartResponse = cartResponseFromMap(jsonString);

import 'dart:convert';

import 'package:commerce/models/cart.dart';

class CartResponse {
  CartResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Infor> data;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    status: json["status"],
    message: json["message"],
    data: List<Infor>.from(json["data"].map((x) => Infor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Infor {
  Infor({
    required this.id,
    required this.userIdBuy,
    required this.productId,
    required this.quantity,
    required this.createDate,
    required this.updateDate,
    required this.isCompleted,
    required this.userIdSell,
  });

  final int id;
  final int userIdBuy;
  final int productId;
  final int quantity;
  final DateTime createDate;
  final DateTime updateDate;
  final bool isCompleted;
  final int userIdSell;

  factory Infor.fromJson(Map<String, dynamic> json) => Infor(
    id: json["id"],
    userIdBuy: json["user_id_buy"],
    productId: json["product_id"],
    quantity: json["quantity"],
    createDate: DateTime.parse(json["create_date"]),
    updateDate: DateTime.parse(json["update_date"]),
    isCompleted: json["isCompleted"],
    userIdSell: json["user_id_sell"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id_buy": userIdBuy,
    "product_id": productId,
    "quantity": quantity,
    "create_date": createDate.toIso8601String(),
    "update_date": updateDate.toIso8601String(),
    "isCompleted": isCompleted,
    "user_id_sell": userIdSell,
  };
}

