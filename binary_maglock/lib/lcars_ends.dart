import 'package:binary_maglock/constants.dart';
import 'package:flutter/material.dart';

class LcarsEndLeft extends StatefulWidget {
  final double height;
  final double width;
  final void Function(String)? pressCallback;
  LcarsEndLeft(
      {super.key,
      required this.height,
      required this.width,
      this.pressCallback});

  @override
  State<LcarsEndLeft> createState() => _LcarsEndLeftState();
}

class _LcarsEndLeftState extends State<LcarsEndLeft> {
  Color buttonColor = lcarsRed;
  @override
  void initState() {
    super.initState();

    buttonColor = lcarsRed;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.height / 2),
          bottomLeft: Radius.circular(widget.height / 2)),
      child: GestureDetector(
        onTapDown: (details) => setState(() {
          buttonColor = Colors.white;
        }),
        onTapUp: (details) => setState(() {
          buttonColor = lcarsRed;
        }),
        onTap: () {
          if (widget.pressCallback != null) {
            print('press callback');
            return widget.pressCallback!('');
          }
          print('not press callback');
          return null;
        },
        child: Container(
          color: lcarsRed,
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }
}

class LcarsEndRight extends StatefulWidget {
  final double height;
  final double width;
  final void Function(String)? pressCallback;
  LcarsEndRight(
      {super.key,
      required this.height,
      required this.width,
      this.pressCallback});

  @override
  State<LcarsEndRight> createState() => _LcarsEndRightState();
}

class _LcarsEndRightState extends State<LcarsEndRight> {
  Color buttonColor = lcarsRed;
  @override
  void initState() {
    super.initState();

    buttonColor = lcarsRed;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.height / 2),
          bottomRight: Radius.circular(widget.height / 2)),
      child: GestureDetector(
        onTapDown: (details) => setState(() {
          buttonColor = Colors.white;
        }),
        onTapUp: (details) => setState(() {
          buttonColor = lcarsRed;
        }),
        onTap: () {
          if (widget.pressCallback != null) {
            print('press callback');
            return widget.pressCallback!('');
          }
          print('not press callback');
          return null;
        },
        child: Container(
          color: lcarsRed,
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }
}
