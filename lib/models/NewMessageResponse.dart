// To parse required this JSON data, do
//
//     final newMessageResponse = newMessageResponsefromJson(jsonString);

import 'dart:convert';

import 'ChatResponse.dart';

class NewMessageResponse {
  NewMessageResponse({
    required this.userId,
    required this.chat,
  });

  final int userId;
  final Chat chat;

  factory NewMessageResponse.fromJson(Map<String, dynamic> json) => NewMessageResponse(
    userId: json["userId"],
    chat: Chat.fromJson(json["chat"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "chat": chat.toJson(),
  };
}

// class Chat {
//   Chat({
//     required this.id,
//     required this.userId,
//     required this.content,
//     required this.createdDate,
//   });
//
//   final int id;
//   final int userId;
//   final String content;
//   final DateTime createdDate;
//
//   factory Chat.fromJson(Map<String, dynamic> json) => Chat(
//     id: json["id"],
//     userId: json["user_id"],
//     content: json["content"],
//     createdDate: DateTime.parse(json["created_date"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_id": userId,
//     "content": content,
//     "created_date": createdDate.toIso8601String(),
//   };
// }
