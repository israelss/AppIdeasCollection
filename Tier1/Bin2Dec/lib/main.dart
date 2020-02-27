import 'package:Bin2Dec/converter_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(ConverterApp());

class ConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 22),
          subtitle1: TextStyle(fontSize: 22),
          button: TextStyle(fontSize: 20),
        ),
      ),
      home: ConverterHome(),
    );
  }
}
