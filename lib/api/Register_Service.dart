import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:commerce/enums.dart';
import 'package:commerce/models/UserResponse.dart';
class Register_Service{
  Future<UserResponse> Register(UserSignUp user)async{
    final url=Uri.parse(ApiUrl+'/users/register');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      UserResponse userResponse=UserResponse.fromJson(jsonDecode(response.body));
      print(userResponse.status);
      return userResponse;
    } else {
      throw Exception();
    }
  }
}