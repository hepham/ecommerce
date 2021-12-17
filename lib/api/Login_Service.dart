import 'package:commerce/enums.dart';
import 'package:commerce/models/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login_Services {
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final url = Uri.parse(
       ApiUrl+ "/users/login");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(loginRequest.toJson()),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to login");
    }
  }
}
