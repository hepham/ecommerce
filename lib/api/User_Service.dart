import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:commerce/enums.dart';
import 'package:commerce/models/UserResponse.dart';

class User_Service {
  static Future GetUserbyId(int id) async {
    final url = Uri.parse(ApiUrl + "/users/"+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      UserResponse userResponse =
          UserResponse.fromJson(jsonDecode(response.body));
          user.id=userResponse.data.id ;
          user.phone=userResponse.data.phone;
          // user.password=userResponse.data.password;
          user.isSeller=userResponse.data.isSeller;
          user.gmail=userResponse.data.gmail;
          user.description=userResponse.data.description;
          user.images=userResponse.data.images;
          user.age=userResponse.data.age;
          user.address=userResponse.data.address;
          user.username=userResponse.data.username;
          print(user.phone);
    } else {
      throw Exception();
    }
  }
}
