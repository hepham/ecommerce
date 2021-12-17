import 'dart:convert';

import 'package:commerce/models/Login.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/user.dart';
import 'package:http/http.dart' as http;

import '../enums.dart';

class ProductApi {
  static Future<List<Product>> GetProduct() async {
    final url = Uri.parse(
        ApiUrl+'/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      ProductResponse productresponse= ProductResponse.fromJson(jsonDecode(response.body));
      print(productresponse.data[0].images.length);
      return productresponse.data;
    } else {
      throw Exception();
    }

  }
  static Future<List<Product>> GetProductbyName(String name) async {
    final url = Uri.parse(
        ApiUrl+'/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      ProductResponse productresponse = ProductResponse.fromJson(
          jsonDecode(response.body));
      print(productresponse.data[0].images.length);
      return productresponse.data;
    } else {
      throw Exception();
    }
  }
  static UpdateProduct(newProduct newproduct) async{
    final url=Uri.parse(ApiUrl+'/products');
    Product temp=convertToProduct(newproduct);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(temp),

    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Update failed.');
    }
  }
}
class UserApi{
  static Future<Data>GetUser() async {
    final url = Uri.parse(
        ApiUrl+'/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      // ProductResponse productresponse= ProductResponse.fromJson(jsonDecode(response.body));
      UserResponse userResponse=UserResponse.fromJson(jsonDecode(response.body));
      print(userResponse.data.username);
      return userResponse.data;
    } else {
      throw Exception();
    }

  }
}
// class LoginApi{
//   static Future<DataLogin> LoginRequest(String phone,String password) async{
//     final url=Uri.parse(ApiUrl+'users/login');
//     LoginAccount loginAccount=new LoginAccount(phone: phone, password: password);
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       // final ProductResponse Products = json.decode(response.body);
//       //   print(response.body.toString());
//       // ProductResponse productresponse= ProductResponse.fromJson(jsonDecode(response.body));
//       UserLogin userLogin=UserLogin.fromJson(jsonDecode(response.body));
//       print(userLogin.dataLogin);
//       return userLogin.dataLogin;
//     } else {
//       throw Exception();
//     }
//   }
// }