import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        flexibleSpace: const SafeArea(
            child: Icon(
          Icons.photo_camera,
          size: 75.0,
          color: Colors.white70,
        )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: const Center(
              child: Text('Bottom'),
            ),
          ),
        ),
      ),
      // Body
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ContainerWithBoxDecorationWidget(),
                Divider(),
                ContainerWithColumns(),
                Divider(),
                ContainerWithRows(),
                Divider(),
                ContainerWithRowsAndColumns(),
                Divider(),
                ContainerWithFlatButtons(),
                Divider(),
                ContainerWithRaisedButtons(),
                Divider(),
                ContainerWithIconButtons(),
                Divider(),
                ContainerButtonBar(),
              ],
            ),
          ),
        ),
      ),
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightGreen.shade100,
        child: const Icon(Icons.play_arrow),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: const BottomAppBar(
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}

// Style # 1
class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.lightGreen.shade500,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0))
            ],
          ),
          child: Center(
            child: RichText(
              text: const TextSpan(
                  text: 'Flutter World',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.deepPurpleAccent,
                    decorationStyle: TextDecorationStyle.dotted,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: ' for',
                    ),
                    TextSpan(
                      text: ' Mobile',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

//Style # 2
class ContainerWithColumns extends StatelessWidget {
  const ContainerWithColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
}

//Style # 3
class ContainerWithRows extends StatelessWidget {
  const ContainerWithRows({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Row 1'),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Text('Row 2'),
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Text('Row 3'),
          ],
        ),
      ],
    );
  }
}

//Style # 4
class ContainerWithRowsAndColumns extends StatelessWidget {
  const ContainerWithRowsAndColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Columns and Row Nesting 1',
        ),
        Text(
          'Columns and Row Nesting 2',
        ),
        Text(
          'Columns and Row Nesting 3',
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Row Nesting 1'),
            Text('Row Nesting 2'),
            Text('Row Nesting 3'),
          ],
        )
      ],
    );
  }
}

//Style # 5
class ContainerWithFlatButtons extends StatelessWidget {
  const ContainerWithFlatButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: const Text('Flag'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            iconColor: Colors.white,
            backgroundColor: Colors.lightGreen,
          ),
          onPressed: null,
          child: const Icon(Icons.flag),
        )
      ],
    );
  }
}

//Style # 6
class ContainerWithRaisedButtons extends StatelessWidget {
  const ContainerWithRaisedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: const Text('Save'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            iconColor: Colors.black,
            backgroundColor: Colors.lightGreen,
          ),
          onPressed: null,
          child: const Icon(Icons.save),
        )
      ],
    );
  }
}

//Style # 7
class ContainerWithIconButtons extends StatelessWidget {
  const ContainerWithIconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.flight)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.flight),
          iconSize: 42.0,
          color: Colors.lightGreen,
          tooltip: 'Flights',
        )
      ],
    );
  }
}

//Style # 8
class ContainerButtonBar extends StatelessWidget {
  const ContainerButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.airport_shuttle)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.brush)),
        ],
      ),
    );
  }
}
