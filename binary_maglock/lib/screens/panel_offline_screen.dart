import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/helpers.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:binary_maglock/maglock_portal_row.dart';
import 'package:binary_maglock/screens/access_denied_screen.dart';

// import 'package:binary_maglock/screens/manual_input_screen.dart';
import 'package:flutter/material.dart';

class PanelOfflineScreen extends StatefulWidget {
  const PanelOfflineScreen({super.key});

  @override
  State<PanelOfflineScreen> createState() => _PanelOfflineScreenState();
}

class _PanelOfflineScreenState extends State<PanelOfflineScreen> {
  int _counter = 0;

  void updateCounter(String buttonValue) {
    // print('pressed $buttonValue, incrementing $_counter');
    _counter += 1;
    if (_counter == 7) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => AccessDeniedScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    final double availableHeight = getSafeHeight(context);
    // final double availableWidth = getSafeWidth(context);
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
                  MaglockPortalServoControlRow(),
                  SizedBox(
                    height: availableHeight / 2,
                    child: Text(
                      'PANEL OFF-LINE',
                      style: TextStyle(
                          fontSize: 120,
                          color: lcarsRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LcarsEndLeft(height: 60, width: 80),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        height: 60,
                        width: 190,
                        color: lcarsRed,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'TUTORIAL',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: (60 / 2.15).roundToDouble()),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '305',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '424',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '7654',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '318',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '786',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '9003',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '612',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsEndRight(height: 60, width: 80)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
