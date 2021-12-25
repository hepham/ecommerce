// To parse required this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);

import 'dart:convert';

class UserResponse {
  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final Data data;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
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
    required this.username,
    required this.gmail,
    required this.phone,
    required this.password,
    required this.address,
    required this.age,
    required this.isSeller,
    required this.description,
    required this.images,
  });

  int id;
  String username;
  String gmail;
  String phone;
  String password;
  String address;
  int age;
  bool isSeller;
  String description;
  String images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        images: json["images"],
        gmail: json["gmail"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        age: json["age"],
        isSeller: json["isSeller"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "images": images,
        "gmail": gmail,
        "phone": phone,
        "password": password,
        "address": address,
        "age": age,
        "isSeller": isSeller,
        "description": description
      };
}

Data user = new Data(
    id: -1,
    username: 'null',
    gmail: '',
    phone: '',
    password: '',
    address: '',
    age: 0,
    isSeller: false,
    description: '',
    images: 'assets/images/avatar.jpg');

class UserSignUp {
  UserSignUp({
    required this.username,
    required this.gmail,
    required this.phone,
    required this.password,
    required this.address,
    required this.age,
    required this.isSeller,
    required this.description,
    required this.images,
  });

  late String username;
  late String gmail;
  late String phone;
  late String password;
  late String address;
  late int age;
  late bool isSeller;
  late String description;
  late String images;

  factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
        username: json["username"],
        images: json["images"],
        gmail: json["gmail"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        age: json["age"],
        isSeller: json["isSeller"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "images": images,
        "gmail": gmail,
        "phone": phone,
        "password": password,
        "address": address,
        "age": age,
        "isSeller": isSeller,
        "description": description,
      };
}
