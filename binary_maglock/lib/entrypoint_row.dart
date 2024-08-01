import 'package:binary/binary.dart';
import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntrypointRow extends StatefulWidget {
  const EntrypointRow({
    super.key,
  });

  @override
  State<EntrypointRow> createState() => _EntrypointRowState();
}

class _EntrypointRowState extends State<EntrypointRow> {
  late bool allButtonsActive;
  List<Widget> entrypointButtons = [];
  // Map<int, bool> activeButtons = {};
  void handoffPressedStatusFromButton(int buttonValue, bool buttonPressState) {
    // activeButtons[buttonValue] = buttonPressState;
    // print(activeButtons);
    // if (!activeButtons.containsValue(false) && allButtonsActive == false) {
    //   setState(() {
    //     allButtonsActive = true;
    //     print('all buttons active = $allButtonsActive');
    //   });
    // } else if (activeButtons.containsValue(false) && allButtonsActive == true) {
    //   setState(() {
    //     allButtonsActive = false;
    //     print('all buttons active = $allButtonsActive');
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    allButtonsActive = false;
    entrypointButtons.add(LcarsEndLeft(height: 60, width: 40));
    for (var i = 6; i >= 0; i--) {
      int powerValue = 2.pow(i);
      // activeButtons[powerValue] = false;
      entrypointButtons.add(EntrypointButton(
        buttonValue: powerValue,
        handoffPressedStatus: handoffPressedStatusFromButton,
      ));
    }
    entrypointButtons.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Text(
          'MAGLOCK',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 48, color: Colors.white),
        ),
      ),
    ));
    entrypointButtons.add(LcarsEndRight(height: 60, width: 60));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: entrypointButtons,
    );
  }
}

class EntrypointButton extends StatefulWidget {
  const EntrypointButton(
      {super.key,
      required this.buttonValue,
      required this.handoffPressedStatus});
  final int buttonValue;
  final void Function(int, bool) handoffPressedStatus;

  @override
  State<EntrypointButton> createState() => _EntrypointButtonState();
}

class _EntrypointButtonState extends State<EntrypointButton> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            active = !active;
          });
          widget.handoffPressedStatus(widget.buttonValue, active);
        },
        child: Container(
          width: 90,
          height: 60,
          color: active ? Colors.white : lcarsRed,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                widget.buttonValue.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
