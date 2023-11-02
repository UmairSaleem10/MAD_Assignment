import 'package:flutter/material.dart';
import 'user_accounts_screen.dart';

class Account {
  final String name;
  final String email;
  final String imageUrl;

  Account({required this.name, required this.email, required this.imageUrl});
}

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Account> accounts = [
    Account(
        name: 'saad', email: 'saad@gmail.com', imageUrl: 'assets/user1.png'),
    Account(
        name: 'umair', email: 'umair@gmail.com', imageUrl: 'assets/user2.png'),
    Account(
        name: 'bakar', email: 'bakar@gmail.com', imageUrl: 'assets/user3.png'),
  ];

  String? selectedEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
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
                              builder: (_) =>
                                  UserAccountsScreen(email: selectedEmail),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.account_circle, size: 48),
                            Text('Accounts', style: TextStyle(fontSize: 24)),
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
                  Text(
                      'Add another account - so you can switch between them easily.'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your existing account',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Manage account',
                          style: TextStyle(color: Colors.yellow)),
                    ],
                  ),
                  SizedBox(height: 16),
                  for (var account in accounts)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedEmail = account.email;
                        });
                      },
                      child: AccountCard(
                        name: account.name,
                        email: account.email,
                        imageUrl: account.imageUrl,
                      ),
                    ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  UserAccountsScreen(email: selectedEmail)));
                    },
                    child: Text('Add Another +'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final bool selected;

  AccountCard(
      {required this.name,
      required this.email,
      required this.imageUrl,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: selected
          ? BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2.0),
            )
          : BoxDecoration(),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(email),
          trailing: Icon(Icons.check),
        ),
      ),
    );
  }
}
