import 'package:Bin2Dec/converter_home.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(ConverterApp());
}

class ConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
