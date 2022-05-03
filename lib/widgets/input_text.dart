import 'package:flutter/material.dart';

Widget inputTextField() {
  return TextFormField(
    decoration: InputDecoration(
      // fillColor: RoddyColors.secondaryColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}
