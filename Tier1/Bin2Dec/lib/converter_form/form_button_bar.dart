import 'package:Bin2Dec/converter_form/form_button.dart';
import 'package:Bin2Dec/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController _binaryController;
RegExp _notZeroOrOne = RegExp(r'[^01]');

void _deleteValue() {
  if (_binaryController.text == '') return;
  _binaryController.text =
      _binaryController.text.substring(1, _binaryController.text.length);
  return;
}

Future<void> _pasteToBinary(BuildContext context) async {
  ClipboardData valueToPaste = await Clipboard.getData('text/plain');
  if (valueToPaste.text.indexOf(_notZeroOrOne) != -1)
    return showAlertDialog(context,
        'Input MUST be only 0\'s and 1\'s\r\n\r\nYou tried to enter: ${valueToPaste.text}');

  return _binaryController.text = valueToPaste.text;
}

class FormButtonBar extends StatelessWidget {
  final TextEditingController binaryController;
  FormButtonBar(this.binaryController);

  @override
  Widget build(BuildContext context) {
    _binaryController = binaryController;
    return Column(
      children: <Widget>[
        Text('Enter a binary number:'),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          buttonMinWidth: MediaQuery.of(context).size.width * 0.24,
          children: <Widget>[
            Container(
              child: RaisedButton.icon(
                onPressed: () => _pasteToBinary(context),
                icon: Icon(Icons.content_paste),
                label: Text('Paste'),
                color: Theme.of(context).primaryColor,
              ),
            ),
            FormButton('0', _binaryController),
            FormButton('1', _binaryController),
            IconButton(icon: Icon(Icons.backspace), onPressed: _deleteValue),
          ],
        ),
      ],
    );
  }
}
