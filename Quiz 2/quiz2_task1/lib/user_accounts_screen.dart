import 'package:flutter/material.dart';
import 'account_screen.dart';

class UserAccountsScreen extends StatefulWidget {
  final String? email;

  UserAccountsScreen({required this.email});

  @override
  _UserAccountsScreenState createState() => _UserAccountsScreenState();
}

class _UserAccountsScreenState extends State<UserAccountsScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the email text box with the selected email.
    emailController.text = widget.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Accounts Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AccountScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.lock, size: 48),
                            Text('Forgot password?',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.star, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement the action to send the reset password link.
                      String enteredEmail = emailController.text;
                      // Use enteredEmail to send the reset password link.

                      print('Reset password link sent to: $enteredEmail');
                      Navigator.pop(context);
                    },
                    child: Text('Send Link'),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Forgot your email? '),
                        GestureDetector(
                          onTap: () {
                            // Implement the action for "Try phone number".
                            print('Try phone number');
                          },
                          child: Text('Try phone number',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
