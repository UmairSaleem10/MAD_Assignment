import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_13/Dash.dart';
import 'package:flutter/material.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  late List<Map<String, dynamic>> cardTitles;

  @override
  void initState() {
    // TODO: implement initState
    Getdish();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Dash();
                }),
              );
            }),
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
        body: ListView.builder(
          itemCount: cardTitles.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/1.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      cardTitles[index]["dishName"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(cardTitles[index]["dishId"]),
                    SizedBox(
                      height: 20,
                    ),
                    Text(cardTitles[index]["dishPrice"],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.edit),
                  ),
                )
              ]),
              // child: ListTile(
              //   title: Text(cardTitles[index]),
              //   subtitle: Text('Subtitle for Card $index'),
              //   onTap: () {
              //     // Add your logic when a card is tapped
              //     print('Card $index tapped');
              //   },
              // ),
            );
          },
        ),
      ),
    );
  }

  void Getdish() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('dish').get();

      // Extract data from documents
      List<Map<String, dynamic>> documents = querySnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              doc.data() as Map<String, dynamic>)
          .toList();

      cardTitles = documents;
      setState(() {
        cardTitles = documents;
      });
    } catch (e) {
      print('Error fetching documents: $e');
    }
  }
}
