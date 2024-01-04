import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_13/loginSignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/Dash.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
            "Create your account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Enter name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
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
                final timestamp = FieldValue.serverTimestamp();
                // creating document with email as id
                var doc = FirebaseFirestore.instance
                    .collection("user")
                    .doc(emailController.text);
                //getting JSON format of user data
                Map<String, dynamic> json = {
                  "email": emailController.text,
                  "password": passwordController.text,
                  "name": nameController.text
                };
                json["createdAt"] = timestamp;
                json["updatedAt"] = timestamp;
                // storing data
                await doc.set(json);
                return;
              } catch (e) {
                print(e);
                return;
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // Set the background color to yellow
            ),
            child: Text("Signup")),
      ]),
    );
  }
}
