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
          color: buttonColor,
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
          color: buttonColor,
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }
}

class LcarsRectButton extends StatefulWidget {
  final double height;
  final double width;
  final String? displayText;
  final void Function(String)? pressCallback;
  const LcarsRectButton({
    super.key,
    required this.height,
    required this.width,
    this.displayText,
    this.pressCallback,
  });

  @override
  State<LcarsRectButton> createState() => _LcarsRectButtonState();
}

class _LcarsRectButtonState extends State<LcarsRectButton> {
  Color buttonColor = lcarsRed;
  @override
  void initState() {
    super.initState();

    buttonColor = lcarsRed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() {
        buttonColor = Colors.white;
      }),
      onTapUp: (details) => setState(() {
        buttonColor = lcarsRed;
      }),
      onTap: () {
        if (widget.pressCallback != null) {
          print('press callback');
          return widget.pressCallback!(widget.displayText ?? '');
        }
        print('not press callback');
        return null;
      },
      child: Container(
        color: buttonColor,
        height: widget.height,
        width: widget.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.width / 18, vertical: widget.width / 18),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.displayText ?? '',
              style: TextStyle(
                  fontSize: (widget.height / 2.15).roundToDouble(),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class LcarsRectButtonStickyColor extends StatefulWidget {
  final double height;
  final double width;
  final String? displayText;
  final void Function(String)? pressCallback;
  final bool pressed;
  LcarsRectButtonStickyColor(
      {super.key,
      required this.height,
      required this.width,
      this.displayText,
      this.pressCallback,
      this.pressed = false});

  @override
  State<LcarsRectButtonStickyColor> createState() =>
      _LcarsRectButtonStickyColorState();
}

class _LcarsRectButtonStickyColorState
    extends State<LcarsRectButtonStickyColor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('building ${widget.displayText}:${widget.pressed}');
    Color buttonColor = widget.pressed ? Colors.white : lcarsRed;
    return GestureDetector(
      onTapDown: (details) => setState(() {
        buttonColor = Colors.white;
      }),
      // onTapUp: (details) => setState(() {
      //   buttonColor = lcarsRed;
      // }),
      onTap: () {
        if (widget.pressCallback != null) {
          print('press callback');
          return widget.pressCallback!(widget.displayText ?? '');
        }
        print('not press callback');
        return null;
      },
      child: Container(
        color: buttonColor,
        height: widget.height,
        width: widget.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.width / 18, vertical: widget.width / 18),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.displayText ?? '',
              style: TextStyle(
                  fontSize: (widget.height / 2.15).roundToDouble(),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
