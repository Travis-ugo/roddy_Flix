import 'package:flutter/material.dart';
import 'package:roddy/model/dimensions.dart';

Widget circleWithIconButton(IconData circleWithIconButtonIcon, mediaQuery) {
  double heightAndWidth = mediaQuery.width > 600 ? 40 : 30;
  return Container(
    height: heightAndWidth,
    width: heightAndWidth,
    margin: EdgeInsets.only(right: 6),
    child: Center(
      child: Icon(
        circleWithIconButtonIcon,
        color: Colors.white,
        size: 15,
      ),
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 1.7, color: Colors.white),
      borderRadius: borderRadiusRY(20),
    ),
  );
}
