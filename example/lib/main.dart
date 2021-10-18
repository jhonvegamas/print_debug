import 'package:flutter/material.dart';
import 'package:print_debug/print_debug.dart';

void main() {
  PrintDebug.init(showInReleaseMode: false, visiblePrints: ["SERVICE","ERROR"]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      printDebug("Sample Hello World");
      printDebug("Hello Color!", textColor: TextColor.black, backgroundColor: BackGroundColor.purple);
      printDebug("Hello Debug!", textColor: TextColor.red, backgroundColor: BackGroundColor.white, logType: "DEBUG");
      printDebug("Hello Service!", textColor: TextColor.black, backgroundColor: BackGroundColor.blue, logType: "SERVICE");

      try {
        throw("Error test");
      } catch (e) {
        printDebug("Error in try catch!", error:e, logType: "ERROR");
      }
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Print Debug"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
