import 'package:binary_maglock/constants.dart';
import 'package:binary_maglock/screens/panel_offline_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binary Maglock Redux',
      theme: _buildTheme(Brightness.dark),

      // ThemeData(
      //   colorScheme: ColorScheme.dark().copyWith(surface: lcarsRed),
      //   useMaterial3: true,
      // ),
      home: const PanelOfflineScreen(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData.dark();

  return baseTheme.copyWith(
    colorScheme: ColorScheme.dark().copyWith(surface: lcarsRed),
    textTheme: GoogleFonts.antonioTextTheme(baseTheme.textTheme),
  );
}
