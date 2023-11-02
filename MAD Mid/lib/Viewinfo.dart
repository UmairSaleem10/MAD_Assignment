import 'package:flutter/material.dart';
import 'user_accounts_screen.dart';


class InformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('saad'),
      ),  body: Center(
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
                              builder: (_) =>
                                  AccountScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.account_circle, size: 48),
                            Text('Friends', style: TextStyle(fontSize: 24)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ],
                  ),
                  SizedBox(height: 16),
                  
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    
      body: Center(
        child: Text(
          'Follow       Hire  ',
          
          style: TextStyle(fontSize: 20),
        ),
        
      ),
    );
  }
}
