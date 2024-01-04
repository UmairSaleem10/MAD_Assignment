import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  @override
  _Task2 createState() => _Task2();
}

class _Task2 extends State<Task2> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures and Scaling'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _transformScaleAndTranslate(),
          _positionedStatusBar(context),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image(
          image: AssetImage('assets/images/1.jpeg'),
        ),
      ),
    );
  }

  Positioned _positionedStatusBar(BuildContext context) {
    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Scale: ${_currentScale.toStringAsFixed(4)}',
            ),
            Text(
              'Current: $_currentOffset',
            ),
          ],
        ),
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _currentScale = _lastScale * details.scale;
      _currentOffset =
          _lastOffset + (_startLastOffset - details.focalPoint) / _currentScale;
    });
  }

  void _onDoubleTap() {
    setState(() {
      _currentScale = 2.0;
    });
  }

  void _onLongPress() {
    setState(() {
      _currentOffset = Offset.zero;
      _currentScale = 1.0;
    });
  }
}
