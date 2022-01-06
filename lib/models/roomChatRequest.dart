// To parse required this JSON data, do
//
//     final roomChatRequest = roomChatRequestfromJson(jsonString);

import 'dart:convert';


class RoomChatRequest {
  RoomChatRequest({
    required this.userOneId,
    required this.userTwoId,
  });

  final int userOneId;
  final int userTwoId;

  factory RoomChatRequest.fromJson(Map<String, dynamic> json) => RoomChatRequest(
    userOneId: json["user_one_id"],
    userTwoId: json["user_two_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_one_id": userOneId,
    "user_two_id": userTwoId,
  };
}
// To parse this JSON data, do
//
//     final roomChatReponse = roomChatReponsefromJson(jsonString);


class RoomChatReponse {
  RoomChatReponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final Data data;

  factory RoomChatReponse.fromJson(Map<String, dynamic> json) => RoomChatReponse(
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
    required this.userOneId,
    required  this.userTwoId,
  });

  final int id;
  final int userOneId;
  final int userTwoId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userOneId: json["user_one_id"],
    userTwoId: json["user_two_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_one_id": userOneId,
    "user_two_id": userTwoId,
  };
}
