import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:flutter/material.dart';

class ProgressButttonRow extends StatelessWidget {
  final int progressCount;
  const ProgressButttonRow({super.key, required this.progressCount});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LcarsEndLeft(height: 60, width: 80),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '64',
              buttonColor: progressCount > 0 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '32',
              buttonColor: progressCount > 1 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '16',
              buttonColor: progressCount > 2 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '8',
              buttonColor: progressCount > 3 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '4',
              buttonColor: progressCount > 4 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '2',
              buttonColor: progressCount > 5 ? Colors.white : lcarsRed),
          SizedBox(width: 6),
          ProgressButton(
              width: 80,
              height: 60,
              displayText: '1',
              buttonColor: progressCount > 6 ? Colors.white : lcarsRed),
          SizedBox(width: 10),
          Text(
            'MAGLOCK',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 51, color: Colors.white),
          ),
          SizedBox(width: 10),
          LcarsEndRight(height: 60, width: 80)
        ]);
  }
}

class ProgressButton extends StatelessWidget {
  final String? displayText;
  final double width;
  final double height;
  final Color buttonColor;

  const ProgressButton(
      {super.key,
      this.displayText,
      required this.width,
      required this.height,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: buttonColor,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 18, vertical: width / 18),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            displayText ?? '',
            style: TextStyle(
                fontSize: (height / 2.15).roundToDouble(),
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
