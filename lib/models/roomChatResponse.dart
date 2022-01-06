// To parse required required this JSON data, do
//
//     final roomChat = roomChatfromJson(jsonString);

import 'dart:convert';

import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/roomChat.dart';

RoomChat roomChatfromJson(String str) => RoomChat.fromJson(json.decode(str));

String roomChattoJson(RoomChat data) => json.encode(data.toJson());

class RoomChat {
  RoomChat({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Datum> data;

  factory RoomChat.fromJson(Map<String, dynamic> json) => RoomChat(
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
    required this.userChat,
    required this.lastChat,
  });

  final int id;
  final UserChat userChat;
  LastChat? lastChat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userChat: UserChat.fromJson(json["user_chat"]),
        lastChat: json["last_chat"] == null
            ? null
            : LastChat.fromJson(json["last_chat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_chat": userChat.toJson(),
        "last_chat": lastChat == null ? null : lastChat!.toJson(),
      };
}

class LastChat {
  LastChat({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.content,
    required this.createDate,
  });

  int id;
  int roomId;
  int userId;
  String content;
  DateTime createDate;

  factory LastChat.fromJson(Map<String, dynamic> json) => LastChat(
        id: json["id"],
        roomId: json["room_id"],
        userId: json["user_id"],
        content: json["content"],
        createDate: DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_id": roomId,
        "user_id": userId,
        "content": content,
        "create_date": createDate.toIso8601String(),
      };
}

class UserChat {
  UserChat({
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

  factory UserChat.fromJson(Map<String, dynamic> json) => UserChat(
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

Room convertToRoom(Datum data) {
  Data user1 = new Data(
      id: data.userChat.id,
      username: data.userChat.username,
      gmail: data.userChat.gmail,
      phone: data.userChat.phone,
      password: data.userChat.password,
      address: data.userChat.address,
      age: data.userChat.age,
      isSeller: data.userChat.isSeller,
      description: data.userChat.description,
      images: data.userChat.images);
  String lastchat='';
  if(data.lastChat!=null){lastchat=data.lastChat!.content;}
  Room tempt=new Room(data.id, user1, user, lastchat);
  return tempt;
}
List<Room> convertToListRoom(List<Datum> data){
  List<Room> ListRoom=[];
  for(int i=0;i<data.length;i++){
    Room room=convertToRoom(data[i]);
    ListRoom.add(room);
  }
  return ListRoom;
}
