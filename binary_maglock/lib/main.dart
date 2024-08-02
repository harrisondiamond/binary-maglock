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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });

//   // final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _targetValue = 0;
//   String _currentInput = '';

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _targetValue = Random().nextInt(127) + 1;
//   }

//   bool checkAgainstTargetValue(String input, int target) {
//     if (input.isEmpty) {
//       return false;
//     }
//     print(input.bits);
//     if (input.bits == target) {
//       print('true');
//       return true;
//     }
//     print('false');
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.black,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               EntrypointRow(
//                 enableMaglock: (enable) => null,
//               ),
//               Text(
//                 'MANUAL INPUT',
//                 style: TextStyle(fontSize: 72, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 'LOCAL SUBSYSTEM ACCESS DENIED',
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
//               ),
//               Text(
//                 'SUBSYS ID = MAGLOCK AE35',
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
//               ),
//               Text(
//                 'ACCESS CODE = $_targetValue',
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
//               ),
//               Text(
//                 'INPUT = $_currentInput',
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 12.0, vertical: 34.0),
//                   child: InputRow(
//                     handoffPresses: (inputValue) {
//                       if (_currentInput.length >= 8) return;
//                       setState(() {
//                         _currentInput += inputValue;
//                         print(_currentInput);
//                         checkAgainstTargetValue(_currentInput, _targetValue);
//                       });
//                     },
//                     handoffBackspace: (backspaceValue) {
//                       if (_currentInput.length <= 0) return;

//                       setState(() {
//                         _currentInput = _currentInput.substring(
//                             0, _currentInput.length - 1);
//                         // print(_currentInput);
//                         checkAgainstTargetValue(_currentInput, _targetValue);
//                       });
//                     },
//                   )),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (_) => MyHomePage()));
//                 },
//                 child: Text('Reset'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
