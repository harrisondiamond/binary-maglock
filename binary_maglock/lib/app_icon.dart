import 'package:binary_maglock/input_row.dart';
import 'package:binary_maglock/progress_button_row.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // final double availableHeight = getSafeHeight(context);
    // final double availableWidth = getSafeWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.black,
            width: 1024,
            height: 1024,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ProgressButttonRow(progressCount: 0),
                  Text(
                    'MAGLOCK CYCLE COMPLETE',
                    style:
                        TextStyle(fontSize: 170, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  InputRow(
                    handoffPresses: (inputValue) {},
                    handoffBackspace: (backspaceValue) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
