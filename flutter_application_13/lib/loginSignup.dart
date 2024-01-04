import 'package:flutter_application_13/Login.dart';
import 'package:flutter_application_13/Signup.dart';
import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Text(
            "Food Ordering App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Please verify yourself and enjoy",
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset("assets/images/1.png"),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
            child: Text("Login")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signup(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // Set the background color to yellow
            ),
            child: Text("Sign up")),
      ]),
    );
  }
}
