import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures and Drag & Drop'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              // _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              // _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      // Uncomment the following lines to experiment with other gestures
       onVerticalDragUpdate: (DragUpdateDetails details) {
         print('onVerticalDragUpdate: $details');
         _displayGestureDetected('onVerticalDragUpdate:\n$details');
       },
      // onHorizontalDragUpdate: (DragUpdateDetails details) {
      //   print('onHorizontalDragUpdate: $details');
      //   _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      // },
      // onHorizontalDragEnd: (DragEndDetails details) {
      //   print('onHorizontalDragEnd: $details');
      //   if (details.primaryVelocity < 0) {
      //     print('Dragging Right to Left: ${details.velocity}');
      //   } else if (details.primaryVelocity > 0) {
      //     print('Dragging Left to Right: ${details.velocity}');
      //   }
      // },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }
}
