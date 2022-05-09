import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, String error) {
  Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(error, textAlign: TextAlign.center)));
}