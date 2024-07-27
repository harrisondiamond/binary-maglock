import 'dart:math';

import 'package:binary/binary.dart';
import 'package:binary_maglock/entrypoint_row.dart';
import 'package:binary_maglock/input_row.dart';
import 'package:flutter/material.dart';

class ManualInputScreen extends StatefulWidget {
  const ManualInputScreen({super.key});

  @override
  State<ManualInputScreen> createState() => _ManualInputScreenState();
}

class _ManualInputScreenState extends State<ManualInputScreen> {
  int _targetValue = 0;
  String _currentInput = '';

  @override
  void initState() {
    super.initState();
    _targetValue = Random().nextInt(127) + 1;
  }

  bool checkAgainstTargetValue(String input, int target) {
    if (input.isEmpty) {
      return false;
    }
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
              Text(
                'MANUAL INPUT',
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w600),
              ),
              Text(
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
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 34.0),
                  child: InputRow(
                    handoffPresses: (inputValue) {
                      if (_currentInput.length >= 8) return;
                      setState(() {
                        _currentInput += inputValue;
                        print(_currentInput);
                        checkAgainstTargetValue(_currentInput, _targetValue);
                      });
                    },
                    handoffBackspace: (backspaceValue) {
                      if (_currentInput.length <= 0) return;

                      setState(() {
                        _currentInput = _currentInput.substring(
                            0, _currentInput.length - 1);
                        // print(_currentInput);
                        checkAgainstTargetValue(_currentInput, _targetValue);
                      });
                    },
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ManualInputScreen()));
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
