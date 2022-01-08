// To parse required required this JSON data, do
//
//     final MessagesResponse = MessagesResponsefromJson(jsonString);

import 'dart:convert';

import 'messages.dart';


class MessagesResponse {
  MessagesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Chat> data;

  factory MessagesResponse.fromJson(Map<String, dynamic> json) => MessagesResponse(
    status: json["status"],
    message: json["message"],
    data: List<Chat>.from(json["data"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Chat {
  Chat({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.content,
    required this.createDate,
  });

  final int id;
  final int roomId;
  final int userId;
  final String content;
  final DateTime createDate;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
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
// Message convertToMessage( ){}
