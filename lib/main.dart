import 'package:flutter/material.dart';
import 'Calculator Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BmiCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
