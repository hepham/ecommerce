// To parse required this JSON data, do
//
//     final commentResponse = commentResponseFromMap(jsonString);

// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromMap(jsonString);

import 'dart:convert';



class CommentResponse {
  CommentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Datum> data;

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.productId,
    required this.content,
    required this.createDate,
    required this.userComment,
  });

  final int id;
  final int productId;
  final String content;
  final DateTime createDate;
  final UserComment userComment;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productId: json["product_id"],
    content: json["content"],
    createDate: DateTime.parse(json["create_date"]),
    userComment: UserComment.fromJson(json["user_comment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "content": content,
    "create_date": createDate.toIso8601String(),
    "user_comment": userComment.toJson(),
  };
}

class UserComment {
  UserComment({
    required this.id,
    required this.username,
    required this.password,
    required this.gmail,
    required this.phone,
    required this.address,
    required this.age,
    required this.isSeller,
    required this.description,
    required this.images,
  });

  final int id;
  final String username;
  final String password;
  final String gmail;
  final String phone;
  final String address;
  final int age;
  final bool isSeller;
  final String description;
  final String images;

  factory UserComment.fromJson (Map<String, dynamic> json) => UserComment(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    gmail: json["gmail"],
    phone: json["phone"],
    address: json["address"],
    age: json["age"],
    isSeller: json["isSeller"],
    description: json["description"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "gmail": gmail,
    "phone": phone,
    "address": address,
    "age": age,
    "isSeller": isSeller,
    "description": description,
    "images": images,
  };
}


class CommentRequest {
  CommentRequest({
    required this.productId,
    required this.userId,
    required this.content,
  });

   int productId;
   int userId;
  String content;

  factory CommentRequest.fromJson(Map<String, dynamic> json) => CommentRequest(
    productId: json["product_id"],
    userId: json["user_id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "product_id": productId,
      "user_id": userId,
      "content": content,
    };
    return map;
  }
}
