import 'package:Bin2Dec/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(ConverterApp());

RegExp _notZeroOrOne = RegExp(r'[^01]');

Converter converter = Converter();
TextEditingController _binaryController = TextEditingController(text: '0');
TextEditingController _decimalController = TextEditingController(text: '0');

void Function(String) _convert =
    (input) => _decimalController.text = converter.bin2dec(input).toString();

void _binaryTapped() {
  if (_binaryController.text.length == 1)
    _binaryController.selection = TextSelection(
        baseOffset: 0, extentOffset: _binaryController.text.length);
}

class BinaryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldBinaryString, TextEditingValue newBinaryString) {
    if (newBinaryString.text.length == 0) return TextEditingValue(text: '0');
    if (newBinaryString.text.length > 8) return oldBinaryString;
    if (newBinaryString.text.indexOf(_notZeroOrOne) != -1)
      return oldBinaryString;
    return newBinaryString;
  }
}

class ConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Binary to Decimal Converter')),
        body: Container(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Binary'),
                  controller: _binaryController,
                  inputFormatters: [BinaryFormatter()],
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  maxLengthEnforced: true,
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
          ),
        ),
      ),
    );
  }
}
