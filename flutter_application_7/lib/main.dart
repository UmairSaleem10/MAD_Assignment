// main.dart
// ...

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

// ...

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBar Example'),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Enables a notch
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to Home
              },
            ),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {
                // Navigate to Business
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                // Navigate to More
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement your floating action button action here
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
