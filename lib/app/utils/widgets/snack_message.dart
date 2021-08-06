import 'package:flutter/material.dart';

enum SnackMessageType {
  success,
  error,
}

void showMessage(BuildContext context, String message, SnackMessageType type) {
  final color = type.index == 0 ? Colors.pink[900] : Colors.red[900]; 

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message, textAlign: TextAlign.center)
    ),
  );
}