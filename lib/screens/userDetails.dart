import 'package:flutter/material.dart';
import 'package:interview/loginScreen.dart';
import 'package:interview/models/loginModel.dart';
import 'package:interview/screens/customerList.dart';

class UserDetails extends StatelessWidget {
  LoginModel user;

  UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView(
          children: [
            Container(
              height: 130,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("First Name: ${user.firstName}"),
                  Text("Last Name: ${user.lastName}"),
                  Text("User Id: ${user.id}"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).primaryColor, // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CustomerListScreen();
                  }));
                },
                child: Text("Customer List"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context)
                      .secondaryHeaderColor, // Background color
                  foregroundColor: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  textStyle: TextStyle(fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
