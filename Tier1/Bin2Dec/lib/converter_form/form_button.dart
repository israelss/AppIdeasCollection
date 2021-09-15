import 'package:flutter/material.dart';

void _insertValue(TextEditingController controller, String value) =>
    controller.text = value + controller.text;

class FormButton extends StatelessWidget {
  final String value;
  final TextEditingController controller;
  FormButton(this.value, this.controller);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _insertValue(controller, value), child: Text(value));
  }
}
