import 'dart:convert';

import 'package:commerce/models/Login.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/productInformResponse.dart';
import 'package:http/http.dart' as http;

import '../enums.dart';

class ProductApi {
  static Future<List<Product>> GetProduct() async {
    final url = Uri.parse(ApiUrl + '/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      ProductResponse productresponse =
          ProductResponse.fromJson(jsonDecode(response.body));
      print(productresponse.data[0].images.length);
      return productresponse.data;
    } else {
      throw Exception();
    }
  }
  static Future<List<Product>> GetProductBySeller(int id) async {
    final url = Uri.parse(ApiUrl + '/products/user/'+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      ProductResponse productresponse =
      ProductResponse.fromJson(jsonDecode(response.body));
      print(productresponse.data[0].images.length);
      return productresponse.data;
    } else {
      throw Exception();
    }
  }

  static Future<newProduct> GetProductById(int id) async {
    final url = Uri.parse(ApiUrl + '/products/' + id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      ProductInformResponse productresponse =
          ProductInformResponse.fromJson(jsonDecode(response.body));
      newProduct product = convertID(productresponse.data);
      return product;
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> GetProductbyName(String name) async {
    final url = Uri.parse(ApiUrl + '/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      //   print(response.body.toString());
      ProductResponse productresponse =
          ProductResponse.fromJson(jsonDecode(response.body));
      print(productresponse.data[0].images.length);
      return productresponse.data;
    } else {
      throw Exception();
    }
  }

  static UpdateProduct(newProduct newproduct) async {
    final url = Uri.parse(ApiUrl + '/products/update');
    Product temp = convertToProduct(newproduct);
    print(json.encode(temp.toJson()));
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(temp.toJson()),
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

  static createProduct(newProduct product) async {
    final url = Uri.parse(ApiUrl + '/products/create');
    Product temp = convertToProduct(product);
    print(json.encode(temp.toJson()));
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(temp.toJson()),
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

  static deleteProduct(int id) async {
    final url = Uri.parse(ApiUrl + '/products/delete/'+id.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final ProductResponse Products = json.decode(response.body);
      print(response.body.toString());
    } else {
      throw Exception();
    }
  }
}
// class UserApi{
//   static Future<Data>GetUser() async {
//     final url = Uri.parse(
//         ApiUrl+'/users');
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       // final ProductResponse Products = json.decode(response.body);
//       //   print(response.body.toString());
//       // ProductResponse productresponse= ProductResponse.fromJson(jsonDecode(response.body));
//       UserResponse userResponse=UserResponse.fromJson(jsonDecode(response.body));
//       print(userResponse.data.username);
//       return userResponse.data;
//     } else {
//       throw Exception();
//     }
//
//   }
//
// }
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
