import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF303F9F),
        accentColor: Color(0xFF448AFF),
        scaffoldBackgroundColor: Color(0xFF448AFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFF212121),
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
