import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/lcars_ends.dart';
import 'package:flutter/material.dart';

class PanelOfflineScreen extends StatefulWidget {
  const PanelOfflineScreen({super.key});

  @override
  State<PanelOfflineScreen> createState() => _PanelOfflineScreenState();
}

class _PanelOfflineScreenState extends State<PanelOfflineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LcarsEndLeft(height: 60, width: 80),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      color: lcarsRed,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Align(
                      alignment: Alignment.topRight, // TODO: not working?
                      child: Text(
                        'MAGLOCK PORTAL SERVO CONTROL',
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    LcarsEndRight(height: 60, width: 80)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
