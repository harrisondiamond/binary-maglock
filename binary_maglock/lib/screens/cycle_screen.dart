import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/helpers.dart';
import 'package:binary_maglock/input_row.dart';
import 'package:binary_maglock/progress_button_row.dart';
import 'package:flutter/material.dart';

class CycleScreen extends StatefulWidget {
  const CycleScreen({super.key});

  @override
  State<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  String mainMessage = '';
  int progressCount = 0;
  Color messageColor = Colors.white;
  @override
  void initState() {
    super.initState();
    mainMessage = 'MAGLOCK SERVO CONTROL ACTIVE';
    progressCount = 7;
    messageColor = Colors.white;
    runCycle();
  }

  void runCycle() async {
    print('the future is next');
    await Future.delayed(Duration(seconds: 3));
    print('the future is now');
    setState(() {
      progressCount = 0;
      mainMessage = 'MAGLOCK CYCLE COMPLETE';
      messageColor = lcarsRed;
    });
    for (var i = 6; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        messageColor = Colors.white;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        messageColor = lcarsRed;
      });
    }
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
                  ProgressButttonRow(progressCount: progressCount),
                  SizedBox(
                    width: availableWidth / 2,
                    child: Center(
                      child: Text(
                        mainMessage,
                        style: TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.w600,
                            color: messageColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 34.0),
                      child: InputRow(
                        handoffPresses: (inputValue) {
                          return;
                        },
                        handoffBackspace: (backspaceValue) {
                          return;
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
