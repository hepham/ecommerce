// import 'package:commerce/constants.dart';
//
// import 'package:flutter/material.dart';
//
// class User {
//   final int id;
//   String username;
//   final String email;
//   final String phone;
//   String password;
//   String address;
//   int age;
//   bool isSeller;
//
//   List<String> images;
//   String description;
//
//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.phone,
//     required this.password,
//     required this.age,
//     this.isSeller = false,
//     required this.address,
//     required this.images,
//     required this.description,
//   });
// }//
// List<User> demoUser = [
//   User(
//     id: 1,
//     images: [
//       "assets/images/avatar.jpg",
//     ],
//     age: age,
//     username: userName,
//     description: description,
//     address: address,
//     email: email,
//     phone: phone,
//     password: phone,
//     isSeller: isSeller,
//   ),
// ];
//
// List<User> searchQuery(String? searchText) {
//   return demoUser
//       .where((element) => element.username.toLowerCase().contains(searchText!))
//       .toList();
// }
//
