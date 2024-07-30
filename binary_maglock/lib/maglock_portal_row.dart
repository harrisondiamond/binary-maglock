import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:flutter/widgets.dart';

class MaglockPortalServoControlRow extends StatelessWidget {
  const MaglockPortalServoControlRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        LcarsEndLeft(height: 60, width: 80),
        SizedBox(
          width: 6,
        ),
        Container(
          height: 60,
          width: 200,
          color: lcarsRed,
        ),
        SizedBox(
          width: 10,
        ),
        Align(
          alignment: Alignment.topRight, // TODO: alignment not working?
          child: Text(
            'MAGLOCK PORTAL SERVO CONTROL',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        LcarsEndRight(height: 60, width: 80)
      ],
    );
  }
}
