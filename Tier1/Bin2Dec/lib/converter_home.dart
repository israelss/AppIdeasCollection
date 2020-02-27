import 'package:Bin2Dec/converter_form/converter_form.dart';
import 'package:flutter/material.dart';

class ConverterHome extends StatefulWidget {
  @override
  _ConverterHomeState createState() => _ConverterHomeState();
}

class _ConverterHomeState extends State<ConverterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Binary to Decimal Converter')),
      body: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ConverterForm(),
        );
      }),
    );
  }
}
