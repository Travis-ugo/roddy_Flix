import 'package:flutter/material.dart';
import 'package:roddy/model/dimensions.dart';

Widget filledButton(BuildContext context) {
  return Container(
    height: context.screenRender(percent: .150, dividePercent: 45),
    width: context.screenRender(percent: .50, dividePercent: 250),
    decoration: BoxDecoration(
      borderRadius: borderRadiusRY(2),
      border: Border.all(width: 1.2, color: Color.fromARGB(255, 87, 82, 82)),
    ),
    child: Center(
      child: Text(
        'Manage profile',
        style: TextStyle(color: Colors.grey[50]),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
