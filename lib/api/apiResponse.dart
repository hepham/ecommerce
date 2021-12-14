import 'dart:convert';

import 'package:commerce/models/ProductResponse.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> GetProduct() async {
    final url = Uri.parse(
        'https://04b5-2405-4803-fde0-8830-3050-cea1-34ad-9222.ngrok.io/api/products');
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
}