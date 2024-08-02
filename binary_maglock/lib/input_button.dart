import 'package:binary_maglock/constants.dart';

import 'package:flutter/material.dart';

class LcarsButton extends StatefulWidget {
  const LcarsButton({
    super.key,
    required this.displayValue,
    required this.width,
    required this.height,
    required this.handoffPress,
  });
  final String displayValue;
  final double width;
  final double height;
  final void Function(String)? handoffPress;

  @override
  State<LcarsButton> createState() => _LcarsButtonState();
}

class _LcarsButtonState extends State<LcarsButton> {
  Color containerColor = lcarsRed;
  @override
  void initState() {
    super.initState();
    containerColor = lcarsRed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          containerColor = Colors.white;
        });
        ;
      },
      onTapUp: (details) {
        setState(() {
          containerColor = lcarsRed;
        });
        ;
      },
      onTap: () => (widget.handoffPress != null)
          ? widget.handoffPress!(widget.displayValue)
          : null,
      child: Container(
        color: containerColor,
        height: widget.height,
        width: widget.width,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              widget.displayValue,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
