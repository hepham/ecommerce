// To parse required this JSON data, do
//
//     final chatRequest = chatRequestfromJson(jsonString);

import 'dart:convert';


class ChatRequest {
  ChatRequest({
    required this.roomId,
    required this.userId,
    required this.content,
  });

  final int roomId;
  final int userId;
  final String content;

  factory ChatRequest.fromJson(Map<String, dynamic> json) => ChatRequest(
    roomId: json["room_id"],
    userId: json["user_id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "room_id": roomId,
    "user_id": userId,
    "content": content,
  };
}
