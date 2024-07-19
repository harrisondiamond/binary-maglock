import 'package:flutter/material.dart';

class MaglockInputButton extends StatefulWidget {
  final int buttonValue;
  final int displayValue;
  final void Function(int) handoffValue;

  const MaglockInputButton({
    required this.buttonValue,
    required this.displayValue,
    required this.handoffValue,
    super.key,
  });

  @override
  State<MaglockInputButton> createState() => _MaglockInputButtonState();
}

class _MaglockInputButtonState extends State<MaglockInputButton> {
  bool _buttonPressed = false;

  @override
  void initState() {
    _buttonPressed = false;
    super.initState();
  }

  void pressButton() {
    setState(() {
      _buttonPressed = !_buttonPressed;
    });
    if (_buttonPressed) {
      widget.handoffValue(widget.buttonValue);
    }
    if (!_buttonPressed) {
      widget.handoffValue(-widget.buttonValue);
    }
  }

  TextStyle unpressedTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  TextStyle pressedTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: GestureDetector(
        onTap: pressButton,
        child: Container(
          color: _buttonPressed ? Colors.white : Colors.red,
          width: 90,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Text(
              this.widget.displayValue.toString(),
              style: _buttonPressed ? pressedTextStyle : unpressedTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
