import 'package:flutter/material.dart';

Function(BuildContext, String) _showAlertDialog =
    (context, message, {bool isSuccessMessage: false}) {
  final AlertDialog alert = AlertDialog(
    content: Text(message),
    title: Icon(
      isSuccessMessage ? Icons.gpp_good : Icons.warning,
      color: isSuccessMessage ? Colors.green[700] : Colors.amber[700],
    ),
    actions: <Widget>[CloseButton()],
  );
  return showDialog(context: context, builder: (_) => alert);
};

get showAlertDialog {
  return _showAlertDialog;
}
