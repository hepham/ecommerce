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
    required this.image,
  });

  int id;
  late String username;
  String gmail;
  String phone;
  String password;
  String address;
  int age;
  late bool isSeller;
  String description;
  String image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        image: json["image"],
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
        "gmail": gmail,
        "phone": phone,
        "password": password,
        "address": address,
        "age": age,
        "isSeller": isSeller,
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
    image: 'assets/images/avatar.jpg');

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
    required this.image,
  });

  late String username;
  String gmail;
  String phone;
  String password;
  String address;
  int age;
  late bool isSeller;
  String description;
  String image;

  factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
    username: json["username"],
    image: json["image"],
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
    "gmail": gmail,
    "phone": phone,
    "password": password,
    "address": address,
    "age": age,
    "isSeller": isSeller,
  };
}