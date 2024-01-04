import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_13/Dash.dart';
import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _selectedValue = 1;
  String _selectedItem = 'a';
  TextEditingController dishIdController = TextEditingController();
  TextEditingController dishNameController = TextEditingController();
  TextEditingController dishPriceController = TextEditingController();
  TextEditingController resIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (dishIdController.text.length != 0 &&
              dishNameController.text.length != 0 &&
              dishPriceController.text.length != 0 &&
              resIdController.text.length != 0) {
            try {
              final timestamp = FieldValue.serverTimestamp();
              // creating document with email as id
              var doc = FirebaseFirestore.instance.collection("dish").doc();
              //getting JSON format of user data
              Map<String, dynamic> json = {
                "dishName": dishNameController.text,
                "dishId": dishIdController.text,
                "dishPrice": dishPriceController.text,
                "restrauntId": resIdController.text,
                "isAvailable": _selectedValue,
                "dishType": _selectedItem,
              };
              json["createdAt"] = timestamp;
              json["updatedAt"] = timestamp;
              // storing data
              await doc.set(json);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Dash();
                }),
              );
              return;
            } catch (e) {
              print(e);
            }
          }
          print('Floating Action Button Pressed');
        },
        child: Icon(Icons.add), // You can change the icon as needed
      ),
      appBar: AppBar(
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu), // or any other icon for options
          onPressed: () {
            // Handle options icon press
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: TextField(
                controller: dishIdController,
                decoration: InputDecoration(
                  labelText: 'Dish Id',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: dishNameController,
                decoration: InputDecoration(
                  labelText: 'Dish Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: dishPriceController,
                decoration: InputDecoration(
                  labelText: 'Dish Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RadioListTile(
              title: Text('Available'),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
              },
            ),
            RadioListTile(
              title: Text('Not Available'),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
              },
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: DropdownButton<String>(
                  value: _selectedItem, // Current selected item
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                  items: <String>['a', 'b', 'c']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: resIdController,
                decoration: InputDecoration(
                  labelText: 'Restraunt Id',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
