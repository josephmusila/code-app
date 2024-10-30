// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String accessToken;
    String refreshToken;
    String firstName;
    String lastName;
    int id;

    LoginModel({
        required this.accessToken,
        required this.refreshToken,
        required this.firstName,
        required this.lastName,
        required this.id,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "firstName": firstName,
        "lastName": lastName,
        "id": id,
    };
}
