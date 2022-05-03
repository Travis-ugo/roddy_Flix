import 'package:flutter/material.dart';

Widget footer(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
    child: Wrap(
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Questions? Contact us.'),
              SizedBox(height: 40),
              Text('FAQ'),
              SizedBox(height: 40),
              Text('Cookie Preferences'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('HelpCenter'),
              SizedBox(height: 40),
              Text('Corporate Information'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Text('Terms of Use'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Text('Privacy'),
        ),
      ],
    ),
  );
}
