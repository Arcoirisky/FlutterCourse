import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String labelText,
    required String hintText,
    IconData? icon,
  }) =>
      InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        icon: Icon(icon, color: Colors.deepPurple),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
      );
}
