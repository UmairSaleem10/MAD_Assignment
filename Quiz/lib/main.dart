import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //set initial Orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: Scaffold(
          appBar: AppBar(title: Text(" Orientation pannel")),
          body: OrientationBuilder(builder: (context, orientation) {
            var containerColor;
            if (orientation == Orientation.portrait) {
              containerColor = const Color.fromARGB(
                  255, 243, 33, 40); // Set color for portrait
            } else {
              containerColor =
                  Color.fromARGB(255, 64, 227, 64); // Set color for landscape
            }
            return Container(
              child: Center(
                child: Container(
                    width: 500,
                    height: 600,
                    color: containerColor,
                    child: Center(
                      child: ElevatedButton(
                        child: Text("change Orientation"),
                        onPressed: () {
                          if (MediaQuery.of(context).orientation ==
                              Orientation.portrait) {
                            //if Orientation is portrait then set to landscape mode
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.landscapeRight,
                            ]);
                          } else {
                            //if Orientation is landscape then set to portrait
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                            ]);
                          }
                        },
                      ),
                    )),
              ),
            );
          }),
        ));
  }
}
