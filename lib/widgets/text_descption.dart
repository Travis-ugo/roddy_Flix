import 'package:flutter/material.dart';

Widget textInfo(String textInfo) {
  return Text(
    textInfo,
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget circleAvatar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: CircleAvatar(radius: 2, backgroundColor: Colors.white),
  );
}
