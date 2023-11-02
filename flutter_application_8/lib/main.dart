import'package:flutter/material.dart';

class LoginPage
 
extends StatefulWidget
 
{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState
 
extends State<LoginPage>
 
{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/images/logo.png'),

              // Username field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),

              // Password field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      // TODO: Toggle password visibility
                    },
                  ),
                ),
              ),

              // Forgot password link
              TextButton(
                onPressed: () {
                  // TODO: Handle forgot password
                },
                child: const Text('Forgot password?'),
              ),

              // Login button
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle login
                },
                child: const Text('Login'),
              ),

              // Register button
              TextButton(
                onPressed: () {
                  // TODO: Handle register
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}