import 'dart:math';

import 'package:binary/binary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _targetValue = 0;
  int _currentValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _targetValue = Random().nextInt(255) + 1;
    _currentValue = 0;
  }

  void updateCurrentValue(int valueToAdd) {
    print('input: $valueToAdd, currently: $_currentValue');
    setState(() {
      _currentValue += valueToAdd;
    });

    print('new value = $_currentValue');

    checkAgainstTargetValue();
  }

  bool checkAgainstTargetValue() {
    if (_currentValue == _targetValue) {
      print('values match!');
      return true;
    }
    if (_currentValue < _targetValue) {
      print('$_currentValue is below target: $_targetValue');
    } else if (_currentValue > _targetValue) {
      print('$_currentValue is above target: $_targetValue');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'MANUAL INPUT',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'LOCAL SUBSYSTEM ACCESS DENIED',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'SUBSYS ID = MAGLOCK AE35',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'ACCESS CODE = $_targetValue',
              style: TextStyle(fontSize: 16),
            ),
            Text('INPUT = ${_currentValue.toBinaryPadded(8)}'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaglockInputButton(
                    buttonValue: 128,
                    displayValue: 0421,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 64,
                    displayValue: 3077,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 32,
                    displayValue: 5545,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 16,
                    displayValue: 9320,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 8,
                    displayValue: 1198,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 4,
                    displayValue: 6969,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 2,
                    displayValue: 8894,
                    handoffValue: updateCurrentValue,
                  ),
                  MaglockInputButton(
                    buttonValue: 1,
                    displayValue: 2530,
                    handoffValue: updateCurrentValue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MaglockInputButton extends StatefulWidget {
  final int buttonValue;
  final int displayValue;
  final void Function(int) handoffValue;

  const MaglockInputButton({
    required this.buttonValue,
    required this.displayValue,
    required this.handoffValue,
    super.key,
  });

  @override
  State<MaglockInputButton> createState() => _MaglockInputButtonState();
}

class _MaglockInputButtonState extends State<MaglockInputButton> {
  bool _buttonPressed = false;

  @override
  void initState() {
    _buttonPressed = false;
    super.initState();
  }

  void pressButton() {
    setState(() {
      _buttonPressed = !_buttonPressed;
    });
    if (_buttonPressed) {
      widget.handoffValue(widget.buttonValue);
    }
    if (!_buttonPressed) {
      widget.handoffValue(-widget.buttonValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: GestureDetector(
        onTap: pressButton,
        child: Container(
          color: _buttonPressed ? Colors.white : Colors.red,
          width: 40,
          height: 20,
          child: Text(
            this.widget.displayValue.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
