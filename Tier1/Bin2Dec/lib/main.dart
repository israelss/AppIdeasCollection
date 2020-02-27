import 'package:Bin2Dec/converter_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(ConverterApp());

class ConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConverterHome(),
    );
  }
}
