// To parse this JSON data, do
//
//     final loginAccount = loginAccountFromMap(jsonString);

import 'dart:convert';
// To parse required this JSON data, do
//
//     final LoginResponse = LoginResponseFromMap(jsonString);


class LoginResponse{
  LoginResponse({
    required this.status,
    required this.message,
    required this.dataLogin,
  });

  final String status;
  final String message;
  final DataLogin dataLogin;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    dataLogin: DataLogin.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": dataLogin.toJson(),
  };
}

class DataLogin {
  DataLogin({
    required this.accessToken,

  });

  final String accessToken;

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
  };
}


class LoginRequest {
  LoginRequest({
    this.phone,
    this.password,
  });

  String? phone;
  String? password;
  //
  // factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
  //   phone: json["phone"],
  //   password: json["password"],
  // );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'phone': phone!.trim(),
      'password': password!.trim(),
    };

    return map;
  }

}
