import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/authCubits/authServices.dart';
import 'package:interview/authCubits/authStates.dart';
import 'package:interview/models/loginModel.dart';




class AuthCubits extends Cubit<AuthStates> {
  Authservices authservices;

  AuthCubits({required this.authservices}) : super(AuthInitialState());

  late LoginModel loginModel;



  void login({required String email, required String password}) async {
    emit(AuthLoadingState(email: email, password: password));
    var response = await authservices.login(email: email, password: password);
    if (response is LoginModel) {
      loginModel = response;
      
      emit(AuthSuccessState(loginModel: response));
    } else {
      emit(AuthErrorState());
    }
  }

  void logout(BuildContext context) {
   
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have been logged out successfully.'),
        duration: Duration(seconds: 2),
      ),
    );

    
  }
}