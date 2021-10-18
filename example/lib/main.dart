import 'package:flutter/material.dart';
import 'package:print_debug/print_debug.dart';

void main() {
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
      printDebug("Hello World!", textColor: TextColor.black, backgroundColor: BackGroundColor.purple);
      printDebug("Hello World!", textColor: TextColor.red, backgroundColor: BackGroundColor.white);
      printDebug("Hello World!", textColor: TextColor.green, backgroundColor: BackGroundColor.cyan);

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
