import 'dart:convert';
import 'package:commerce/models/ChatRequest.dart';
import 'package:commerce/models/ChatResponse.dart';
import 'package:commerce/models/roomChatRequest.dart';
import 'package:commerce/models/roomChatResponse.dart';
import 'package:http/http.dart' as http;
import '../enums.dart';
class Chat_Services{
  static Future<List<Datum>> GetAllRoomChat(int id) async {
    final url = Uri.parse(
        ApiUrl+'/roomchats/'+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      RoomChat roomresponse= RoomChat.fromJson(jsonDecode(response.body));
      print(roomresponse.data.length);
      return roomresponse.data;
    } else {
      throw Exception();
    }

  }
  static Future<List<chat>> GetAllMessage(int id) async {
    final url = Uri.parse(
        ApiUrl+'/chats/room/'+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      MessagesResponse messagesResponse= MessagesResponse.fromJson(jsonDecode(response.body));
      print(messagesResponse.data[0].content);

      return messagesResponse.data.reversed.toList();
    } else {
      throw Exception();
    }

  }
  static SendMessage(ChatRequest message)async{
    final url=Uri.parse(ApiUrl+ '/chats/create');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(message.toJson()),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Update failed.');
    }

  }
   Future<int> createRoomChat(RoomChatRequest roomChatRequest ) async {
    final url=Uri.parse(ApiUrl+ '/roomchats/create');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(roomChatRequest.toJson()),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
      return RoomChatReponse.fromJson(jsonDecode(response.body)).data.id;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Update failed.');
    }
  }

}