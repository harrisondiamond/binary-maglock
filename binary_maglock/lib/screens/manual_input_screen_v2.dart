import 'dart:math';

import 'package:binary/binary.dart';
import 'package:binary_maglock/helpers.dart';
import 'package:binary_maglock/input_button.dart';
import 'package:binary_maglock/input_row.dart';
import 'package:binary_maglock/screens/panel_offline_screen.dart';
import 'package:flutter/material.dart';

class ManualInputScreenV2 extends StatefulWidget {
  const ManualInputScreenV2({super.key});

  @override
  State<ManualInputScreenV2> createState() => _ManualInputScreenV2State();
}

class _ManualInputScreenV2State extends State<ManualInputScreenV2> {
  int _targetValue = 0;
  String _currentInput = '';
  void resetTarget() {
    _targetValue = Random().nextInt(127) + 1;
    _currentInput = '';
  }

  @override
  void initState() {
    super.initState();
    resetTarget();
  }

  bool checkAgainstTargetValue(String input, int target) {
    if (input.isEmpty) {
      return false;
    }
    print(input.bits);
    if (input.bits == target) {
      print('true');
      setState(() {
        resetTarget();
      });
      return true;
    }
    print('false');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double availableHeight = getSafeHeight(context);
    final double availableWidth = getSafeWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ProgressButttonRow(),
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
                            checkAgainstTargetValue(
                                _currentInput, _targetValue);
                          });
                        },
                        handoffBackspace: (backspaceValue) {
                          if (_currentInput.length <= 0) return;

                          setState(() {
                            _currentInput = _currentInput.substring(
                                0, _currentInput.length - 1);
                            // print(_currentInput);
                            checkAgainstTargetValue(
                                _currentInput, _targetValue);
                          });
                        },
                      )),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => PanelOfflineScreen()));
                    },
                    child: Text('Reset'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressButttonRow extends StatelessWidget {
  const ProgressButttonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LcarsButton(
              displayValue: 'displayValue',
              width: 80,
              height: 60,
              handoffPress: (p0) {})
        ]);
  }
}
