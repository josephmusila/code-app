import 'package:equatable/equatable.dart';

import 'package:interview/models/loginModel.dart';

abstract class AuthStates extends Equatable {}

class AuthInitialState extends AuthStates {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthStates {
  String email;
  String password;

  AuthLoadingState({required this.password,required this.email});
  @override
  List<Object?> get props => [email,password];
}






class AuthErrorState extends AuthStates {
  // LoginErrorModel message;
  // AuthErrorState({required this.message});
  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthStates {
  LoginModel loginModel;

  AuthSuccessState({required this.loginModel});
  @override
  List<Object?> get props => [loginModel];
}

class NoAuthState extends AuthStates {
  @override
  List<Object?> get props => [];
}