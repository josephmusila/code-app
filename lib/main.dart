import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/authCubits/authCubits.dart';
import 'package:interview/authCubits/authServices.dart';
import 'package:interview/listCubits/listCubits.dart';
import 'package:interview/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider<AuthCubits>(
            create: (context) => AuthCubits(authservices: Authservices())),
              BlocProvider<CustomerListCubits>(
            create: (context) => CustomerListCubits(authservices: Authservices())),
     ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
