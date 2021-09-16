import 'package:Bin2Dec/converter.dart';
import 'package:Bin2Dec/converter_form/form_button_bar.dart';
import 'package:Bin2Dec/converter_form/input_field.dart';
import 'package:Bin2Dec/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Converter converter = Converter();

TextEditingController _binaryController = TextEditingController();
TextEditingController _decimalController = TextEditingController();

void _reset() {
  _binaryController.text = '';
  _decimalController.text = '';
}

void _copyDecimal(BuildContext context) {
  if (_decimalController.text.isEmpty)
    return showAlertDialog(context, 'No value to copy!');

  Clipboard.setData(ClipboardData(text: _decimalController.text));
  return showAlertDialog(context, 'Decimal copied to clipboard',
      isSuccessMessage: true);
}

void Function(String) _convert = (input) {
  if (input == '') _binaryController.text = '0';
  return _decimalController.text = converter.bin2dec(input).toString();
};

class ConverterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32),
              FormButtonBar(_binaryController),
              SizedBox(height: 16),
              InputField(
                label: 'Binary',
                enabled: false,
                readOnly: true,
                icon: Icon(Icons.close),
                iconAction: _reset,
                controller: _binaryController,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Convert!'),
                onPressed: () => _convert(_binaryController.text),
              ),
              SizedBox(height: 24),
              InputField(
                label: 'Decimal',
                enabled: false,
                readOnly: true,
                icon: Icon(Icons.content_copy),
                iconAction: () => _copyDecimal(context),
                controller: _decimalController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
