import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/helpers.dart';
import 'package:binary_maglock/lcars_buttons.dart';
import 'package:binary_maglock/maglock_portal_row.dart';
import 'package:flutter/material.dart';

class AccessDeniedScreen extends StatefulWidget {
  const AccessDeniedScreen({super.key});

  @override
  State<AccessDeniedScreen> createState() => _AccessDeniedScreenState();
}

class _AccessDeniedScreenState extends State<AccessDeniedScreen> {
  void updateCounter(String aaa) {
    return;
  }

  Map<int, bool> pressedButtons = {};
  //TODO: Working on denied screen, how to enter main game mode.
  void press64(String a) {}

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
                  MaglockPortalServoControlRow(),
                  SizedBox(
                      height: availableHeight / 2,
                      child: Column(children: [
                        Text(
                          'ACCESS DENIED',
                          style: TextStyle(
                              fontSize: 120,
                              color: lcarsRed,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'LCARS COMMAND NET NOT AVAILABLE',
                          style: TextStyle(
                              fontSize: 60,
                              color: lcarsRed,
                              fontWeight: FontWeight.w500),
                        )
                      ])),
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
                                'LCARS',
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
                        displayText: '64',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '32',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '16',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '8',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '4',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '2',
                        pressCallback: (p0) => updateCounter(p0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      LcarsRectButton(
                        height: 60,
                        width: 80,
                        displayText: '1',
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
