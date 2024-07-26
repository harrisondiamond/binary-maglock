import 'dart:math';

import 'package:binary/binary.dart' as binary;
import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/entrypoint_row.dart';
import 'package:binary_maglock/input_row.dart';

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
          colorScheme: ColorScheme.dark().copyWith(surface: lcarsRed),
          useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _targetValue = 0;
  int _currentValue = 0;
  String _currentInput = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _targetValue = Random().nextInt(127) + 1;
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

  bool checkAgainstTargetValueV2(String input, int target) {
    print(input.bits);
    if (input.bits == target) {
      print('true');
      return true;
    }
    print('false');
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
                'INPUT = $_currentInput',
                style: TextStyle(fontSize: 36),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 34.0),
                  child: InputRow(
                    handoffPresses: (inputValue) {
                      setState(() {
                        _currentInput += inputValue;
                        print(_currentInput);
                        checkAgainstTargetValueV2(_currentInput, _targetValue);
                      });
                    },
                    handoffBackspace: (backspaceValue) {
                      if (_currentInput.length > 0) {
                        setState(() {
                          _currentInput = _currentInput.substring(
                              0, _currentInput.length - 1);
                          print(_currentInput);
                          checkAgainstTargetValueV2(
                              _currentInput, _targetValue);
                        });
                      }
                    },
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => MyHomePage()));
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
