import 'package:commerce/models/CommentResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../enums.dart';
class Comment_Services{
  static Future<String> CreateComment(CommentRequest commentRequest)async{
    final url=Uri.parse(ApiUrl+"/comments/create");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(commentRequest.toJson()),
    );
    if(response.statusCode==200){
      print(response.body);
      return "success";
      // return CommentResponse.fromJson(jsonDecode(response.body)).status;
    }else{
      throw Exception("fail to send comment");
    }
  }
  static Future<CommentResponse> getComment(int id)async{
    final url=Uri.parse(ApiUrl+"/comments/"+id.toString());
   final response=await http.get(url);
    if(response.statusCode==200){
      print(response.body);
      return CommentResponse.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("fail to send comment");
    }
  }
}