
import 'package:commerce/constants.dart';
import 'package:commerce/screen/profile/tabs/settings.dart';
import 'package:flutter/material.dart';



class Address {
  String street;
  String city;
  String state;
  int postcode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postcode,
  });

  @override
  String toString() {
    // TODO: implement toString
    return street + ", " + city + ", " + state +", "+ "Postcode: "+postcode.toString() ;
  }

}
class User {

  final int id,age;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final Address address;


  User({
    required this.id,
    required this.age,
    required this.images,
    required this.colors,
    required this.title,
    required this.address,
    required this.description,
  });
}
List<User> demoUser = [
  User(
    id: 1,
    images: [
      "assets/images/avatar.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    age: age,
    title: userName,
    description: description,
    address: address,

  ),


];

List<User> searchQuery(String? searchText) {
  return demoUser.
  where((element) =>
      element.title.toLowerCase().contains(searchText!)).toList();
}

Address address = Address(street: "Cổ Nhuế 2", city: "Hà Nội", state: "Việt Nam", postcode: 100000);
const int age = 22;
const String description =
    "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence—a commodity capable of unlocking humanity's greatest potential—only those who can conquer their fear will survive.\nPaul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence—a commodity capable of unlocking humanity's greatest potential—only those who can conquer their fear will survive.";