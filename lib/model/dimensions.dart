import 'package:flutter/material.dart';

extension DimensionContext on BuildContext {
  bool isScreenLarge() => MediaQuery.of(this).size.width > 600;
  double screenRender({
    required double percent,
    required double dividePercent,
  }) =>
      MediaQuery.of(this).size.width > 600
          ? dividePercent
          : screenWidth(percent);
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

BorderRadiusGeometry? borderRadiusRY([double circle = 10]) =>
    BorderRadius.circular(circle);
