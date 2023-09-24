import 'package:flutter/material.dart';
import 'package:flutter_01/image_and_icon.dart';
import 'package:flutter_01/validation_form.dart';
import 'package:flutter_01/home.dart';
import 'package:flutter_01/orientation_aap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ValidateForms(),
    );
  }
}
