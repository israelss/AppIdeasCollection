import 'package:Bin2Dec/binary_formatter.dart';
import 'package:Bin2Dec/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Converter converter = Converter();
TextEditingController _binaryController = TextEditingController(text: '0');
TextEditingController _decimalController = TextEditingController(text: '0');

void Function(String) _convert =
    (input) => _decimalController.text = converter.bin2dec(input).toString();

void _binaryTapped() {
  if (_binaryController.text.length == 1) {
    _binaryController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _binaryController.text.length,
    );
  }
}

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
        return Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Binary'),
                controller: _binaryController,
                inputFormatters: [BinaryFormatter(context)],
                keyboardType: TextInputType.number,
                maxLength: 8,
                maxLengthEnforced: false,
                onTap: _binaryTapped,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Decimal'),
                controller: _decimalController,
              ),
              RaisedButton(
                child: Text('Convert!'),
                onPressed: () => _convert(_binaryController.text),
              ),
            ],
          ),
        );
      }),
    );
  }
}
