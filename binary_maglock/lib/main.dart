import 'dart:math';

import 'package:binary/binary.dart';
import 'package:binary_maglock/entrypoint_row.dart';
import 'package:binary_maglock/maglock_input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.dark().copyWith(surface: Colors.red),
          useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              EntrypointRow(
                enableMaglock: (enable) => null,
              ),
              const Text(
                'MANUAL INPUT',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              const Text(
                'LOCAL SUBSYSTEM ACCESS DENIED',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              Text(
                'SUBSYS ID = MAGLOCK AE35',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              Text(
                'ACCESS CODE = $_targetValue',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              Text(
                'INPUT = ${_currentValue.toBinaryPadded(8)}',
                style: TextStyle(fontSize: 36),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 34.0),
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
              ),
              ElevatedButton(
                onPressed: () {
                  //todo: reset the page
                },
                child: Text('Reset'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
