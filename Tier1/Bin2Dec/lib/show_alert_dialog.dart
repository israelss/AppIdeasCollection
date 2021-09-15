import 'package:flutter/material.dart';

Function(BuildContext, String) _showAlertDialog = (context, message) {
  final AlertDialog alert = AlertDialog(
    content: Text(message),
    title: Icon(
      Icons.warning,
      color: Colors.amber[700],
    ),
    actions: <Widget>[CloseButton()],
  );
  return showDialog(context: context, builder: (_) => alert);
};

get showAlertDialog {
  return _showAlertDialog;
}
