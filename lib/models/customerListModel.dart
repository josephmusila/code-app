// To parse this JSON data, do
//
//     final customerListModel = customerListModelFromJson(jsonString);

import 'dart:convert';

CustomerListModel customerListModelFromJson(String str) => CustomerListModel.fromJson(json.decode(str));

String customerListModelToJson(CustomerListModel data) => json.encode(data.toJson());

class CustomerListModel {
    String description;
    List<Response> response;
    int status;

    CustomerListModel({
        required this.description,
        required this.response,
        required this.status,
    });

    factory CustomerListModel.fromJson(Map<String, dynamic> json) => CustomerListModel(
        description: json["description"],
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "status": status,
    };
}

class Response {
    String firstName;
    String otherNames;
    String gender;
    String mobileNumber;
    String email;
    String description;

    Response({
        required this.firstName,
        required this.otherNames,
        required this.gender,
        required this.mobileNumber,
        required this.email,
        required this.description,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        firstName: json["first_name"],
        otherNames: json["other_names"],
        gender: json["gender"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "other_names": otherNames,
        "gender": gender,
        "mobile_number": mobileNumber,
        "email": email,
        "description": description,
    };
}
