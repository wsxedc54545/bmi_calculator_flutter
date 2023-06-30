import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'pages/result_page.dart';
import 'constants/constants.dart';

void main() => runApp(const BMICalculator());

ThemeData myTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  scaffoldBackgroundColor: inactiveCardColor,

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  appBarTheme: const AppBarTheme(
    color: inactiveCardColor, // Set the color of the AppBar
  ),
);

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      routes: {
        '/': (context) => const InputPage(),
        // '/result': (context) => const ResultPage(bmiResult: '', interpretation: '', resultText: '',),
        '/result': (context) => const ResultPage(),
      },
    );
  }
}

class CalculatorRouteArguments {
  CalculatorRouteArguments({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;
}