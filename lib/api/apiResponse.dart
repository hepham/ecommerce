import 'dart:convert';

import 'package:commerce/models/ProductResponse.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> GetProduct() async {
    final url = Uri.parse(
        'https://2e49-2405-4803-fde0-8830-1472-1c18-fc88-9e21.ngrok.io/api/products');
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
        'https://2e49-2405-4803-fde0-8830-1472-1c18-fc88-9e21.ngrok.io/api/products');
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
    final url=Uri.parse('https://2e49-2405-4803-fde0-8830-1472-1c18-fc88-9e21.ngrok.io/api/products');
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