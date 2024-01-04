import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_13/Dashbord.dart';
import 'package:flutter_application_13/loginSignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/Dash.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static Future<Map<String, dynamic>?> getDocumentIfItExists(
      String collectionName, String documentId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      //trying to fectch record
      final DocumentSnapshot documentSnapshot =
          await firestore.collection(collectionName).doc(documentId).get();

      if (documentSnapshot.exists) {
        // conveting document into Map and returning
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        // If document not found
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Text(
            "Enter email and password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Enter email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Enter password',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                Map<String, dynamic>? userJson =
                    await getDocumentIfItExists("user", emailController.text);
                // id document not found
                print(emailController.text);
                print(passwordController.text);
                if (userJson == null) return null;
                print("user");
                // if user not found
                if (userJson["password"] != passwordController.text)
                  return null;
                print("user");
                // getting AccountHolder from JSON
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Dashbord();
                  }),
                );
              } catch (e) {
                print(e);
                return null;
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // Set the background color to yellow
            ),
            child: Text("Login")),
      ]),
    );
  }
}
