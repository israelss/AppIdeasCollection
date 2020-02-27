import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Bin2Dec/show_alert_dialog.dart';

RegExp _notZeroOrOne = RegExp(r'[^01]');

class BinaryFormatter extends TextInputFormatter {
  BuildContext context;
  BinaryFormatter(this.context);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldBinaryString, TextEditingValue newBinaryString) {
    if (newBinaryString.text.length == 0) return TextEditingValue(text: '0');

    if (newBinaryString.text.indexOf(_notZeroOrOne) != -1) {
      showAlertDialog(context, 'Input MUST be only 0\'s and 1\'s');
      return oldBinaryString;
    }

    if (newBinaryString.text.length > 8) {
      showAlertDialog(context, 'Input MUST be only 8 digits long');
      return oldBinaryString;
    }

    return newBinaryString;
  }
}
