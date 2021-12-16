import 'package:commerce/constants.dart';

import 'package:flutter/material.dart';

class User {
  final int id;
  String username;
  final String email;
  final String phone;
  String password;
  String address;
  int age;
  bool isSeller;

  List<String> images;
  String description;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.age,
    this.isSeller = false,
    required this.address,
    required this.images,
    required this.description,
  });
}

List<User> demoUser = [
  User(
    id: 1,
    images: [
      "assets/images/avatar.jpg",
    ],
    age: age,
    username: userName,
    description: description,
    address: address,
    email: email,
    phone: phone,
    password: phone,
    isSeller: isSeller,
  ),
];

List<User> searchQuery(String? searchText) {
  return demoUser
      .where((element) => element.username.toLowerCase().contains(searchText!))
      .toList();
}

bool isSeller = false;
String userName = "Hà Đăng";
const String email = "test@gmail.com";
String phone = "0123456789";
String password = "password";
String address = "Cổ Nhuế, Hà Nội, Việt Nam";
int age = 22;
String description =
    "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence—a commodity capable of unlocking humanity's greatest potential—only those who can conquer their fear will survive.\nPaul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence—a commodity capable of unlocking humanity's greatest potential—only those who can conquer their fear will survive.";
