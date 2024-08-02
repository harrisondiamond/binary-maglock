import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/input_button.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:flutter/material.dart';

class InputRow extends StatelessWidget {
  const InputRow(
      {super.key,
      required this.handoffPresses,
      required this.handoffBackspace});
  final void Function(String) handoffPresses;
  final void Function(String) handoffBackspace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        LcarsEndLeft(
          height: 60,
          width: 80,
          pressCallback: handoffBackspace,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: lcarsRed,
            height: 60,
            width: 120,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'LCARS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 400,
          color: lcarsRed,
        ),
        SizedBox(
          width: 5,
        ),
        LcarsButton(
            displayValue: '1',
            handoffPress: handoffPresses,
            // handoffPress: (p0) => null,
            width: 120,
            height: 60),
        SizedBox(
          width: 5,
        ),
        LcarsButton(
          displayValue: '0',
          handoffPress: handoffPresses,
          // handoffPress: (p0) => null,
          width: 120,
          height: 60,
        ),
        SizedBox(
          width: 5,
        ),
        LcarsEndRight(height: 60, width: 80)
      ],
    );
  }
}
