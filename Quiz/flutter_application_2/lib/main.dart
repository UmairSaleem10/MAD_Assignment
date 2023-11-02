import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
 title: Text('Navigator'),
 actions: <Widget>[
 IconButton(
 icon: Icon(Icons.info_outline),
 onPressed: () => _openPageAbout(
 context: context,
 fullscreenDialog: true,
 ),
 ),
 ],
),
      ),
    );
  }
}