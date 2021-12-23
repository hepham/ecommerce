
import 'dart:convert';


class OrderRequest {
  OrderRequest({
    required this.userIdBuy,
    required this.productId,
    required this.quantity,
    required this.isCompleted,
    required this.userIdSell,
  });

  final int userIdBuy;
  final int productId;
  final int quantity;
  final bool isCompleted;
  final int userIdSell;

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
    userIdBuy: json["user_id_buy"],
    productId: json["product_id"],
    quantity: json["quantity"],
    isCompleted: json["isCompleted"],
    userIdSell: json["user_id_sell"],
  );

  Map<String, dynamic> toJson() => {
    "user_id_buy": userIdBuy,
    "product_id": productId,
    "quantity": quantity,
    "isCompleted": isCompleted,
    "user_id_sell": userIdSell,
  };
}
