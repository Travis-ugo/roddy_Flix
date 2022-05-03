import 'package:flutter/material.dart';
import 'package:roddy/utils/dimensions.dart';

class SelectProfileBox extends StatelessWidget {
  const SelectProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 7),
          child: Center(
              child: Text(
            'Image Profile',
            textAlign: TextAlign.center,
          )), //Image.network(''),
          width: context.screenRender(
            percent: .16,
            dividePercent: context.screenWidth(.11),
          ),
          height: context.screenRender(
            percent: .16,
            dividePercent: context.screenWidth(.11),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
        Text(
          'Name',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
