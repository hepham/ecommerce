import 'package:commerce/enums.dart';
import 'package:commerce/models/CartResponse.dart';

import 'package:commerce/models/oderRequest.dart';
import 'package:commerce/models/orderResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Order_Service {
  Future<OrderResponse> Order(OrderRequest orderRequest) async {
    final url = Uri.parse(ApiUrl + '/orders/create');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(orderRequest.toJson()),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return OrderResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to order");
    }
  }

  static deleteOrder(int id) async {
    final url = Uri.parse(ApiUrl + '/orders/delete/' + id.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("failed to order");
    }
  }

  Future<List<Infor>> getListOrderUser(int id) async {
    final url = Uri.parse(ApiUrl + '/orders/buy/' + id.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      CartResponse orderResponse =
          CartResponse.fromJson(jsonDecode(response.body));
      return orderResponse.data;
    } else {
      throw Exception("failed to order");
    }
  }
  Future<List<Infor>> getListOrderSeller(int id) async {
    final url = Uri.parse(ApiUrl + '/orders/sell/' + id.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      CartResponse orderResponse =
      CartResponse.fromJson(jsonDecode(response.body));
      return orderResponse.data;
    } else {
      throw Exception("failed to order");
    }
  }
}
