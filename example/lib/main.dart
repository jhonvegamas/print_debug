import 'package:flutter/material.dart';
import 'package:print_debug/print_debug.dart';

void main() {
  PrintDebug.init(
    showInReleaseMode: false,
    showIcons: true,
    visiblePrints: [
      PrintType.DEBUG,
      PrintType.ERROR,
      PrintType.WARNING,
      PrintType.SUCCESS,
      PrintType.LOG,
    ],
  );
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
      printDebug(
        "Hello Color 1!",
        textColor: TextColor.black,
        backgroundColor: BackGroundColor.purple,
      );
      printDebug(
        "Hello Color 2!",
        textColor: TextColor.blue,
        backgroundColor: BackGroundColor.white,
      );

      printDebug("Hello Debug!", printType: PrintType.DEBUG);
      printDebug("Hello Warning!", printType: PrintType.WARNING);
      printDebug("Hello Success!", printType: PrintType.SUCCESS);
      printDebug("Hello Log!", printType: PrintType.LOG);

      try {
        throw ("Error in try catch");
      } catch (e) {
        printDebug(
          "Hello Error",
          error: e,
          printType: PrintType.ERROR,
        );
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
                style: Theme.of(context).textTheme.headline4,
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
