import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:commerce/enums.dart';
import 'package:commerce/models/UserResponse.dart';

class User_Service {
  static Future<Data> GetUserbyId(int id) async {
    final url = Uri.parse(ApiUrl + "/users/"+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      UserResponse userResponse =
          UserResponse.fromJson(jsonDecode(response.body));
      return userResponse.data;
    } else {
      throw Exception();
    }
  }
  static UserUpdate(Data user)async{
    final url=Uri.parse(ApiUrl+ '/users/update');

    print(json.encode(user.toJson()));
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Update failed.');
    }
  }
}
