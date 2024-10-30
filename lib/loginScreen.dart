import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/authCubits/authCubits.dart';
import 'package:interview/authCubits/authStates.dart';
import 'package:interview/customInputField.dart';
import 'package:interview/screens/customerList.dart';
import 'package:interview/screens/userDetails.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phone = TextEditingController();
  var password1 = TextEditingController();

  String mobile = "";
  String pass = "";

  // Create a GlobalKey to identify the Form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("login"),
      ),
      body: BlocListener<AuthCubits, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return UserDetails(
                user: state.loginModel,
              );
            }));
          }
        },
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        child: Center(
                          child: BlocBuilder<AuthCubits, AuthStates>(
                            builder: (context, state) {
                              if (state is AuthErrorState) {
                                return Text(
                                  "error",
                                  // color: Colors.red,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ),
                      CustomInputField(
                        controller: phone,
                        hintText: "",
                        labelText: "Email",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email';
                          }
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomInputField(
                        obscureText: true,
                        controller: password1,
                        hintText: "",
                        labelText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      BlocBuilder<AuthCubits, AuthStates>(
                        builder: (context, state) {
                          if (state is AuthLoadingState) {
                            pass = state.password;
                            mobile = state.email;
                            return Container(
                              height: 40,
                              width: double.maxFinite,
                              child: Center(
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return Container(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .primaryColor, // Background color
                                  foregroundColor: Colors.white, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8),
                                  textStyle: TextStyle(fontSize: 14),
                                ),
                                child: Text("Login"),
                                onPressed: () {
                                  // Validate the form before proceeding
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    context.read<AuthCubits>().login(
                                        email: phone.text,
                                        password: password1.text);
                                  }
                                },
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
