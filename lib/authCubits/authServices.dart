import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview/models/customerListModel.dart';
import 'package:interview/models/loginModel.dart';
import 'package:interview/urls.dart';

class Authservices {
  Future<dynamic> login(
      {required String email, required String password}) async {
    var response = await http.post(Uri.parse('${BaseUrl.baseUrl}login'),
        body: {'email': email, 'password': password});
    print('${BaseUrl.baseUrl}login/');
    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else {
      // return loginErrorModelFromJson(response.body);
    }
  }

  Future<CustomerListModel?> getCustomers() async{
var response = await http.get(Uri.parse("${BaseUrl.baseUrl}customers/get-customers/1"));
if(response.statusCode == 200){
  return  customerListModelFromJson(response.body);
}else{
  return null;
}
  }
}
