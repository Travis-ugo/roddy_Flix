import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roddy/model/dimensions.dart';

Widget listRow(context) {
  return MediaQuery.of(context).size.width > 800
      ? Row(
          children: [
            Text('Home', style: _textStyle),
            SizedBox(width: 15),
            Text('TV Shows', style: _textStyle),
            SizedBox(width: 15),
            Text('Movies', style: _textStyle),
            SizedBox(width: 15),
            Text('New & Popular', style: _textStyle),
            SizedBox(width: 15),
            Text('My List', style: _textStyle),
          ],
        )
      : Text('Browse', style: _textStyle);
}

TextStyle _textStyle = TextStyle(fontSize: 14, color: Colors.white);

var appBarColorProvider = StateProvider<Color>((ref) => Colors.blue);

class RoddyAppBar extends ConsumerWidget {
  const RoddyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var myAppBarColor = ref.watch(appBarColorProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: myAppBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            Text(
              'Roddy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 20),
            listRow(context),
            Spacer(),
            Icon(CupertinoIcons.search, color: Colors.white),
            SizedBox(width: 15),
            Text('kids', style: _textStyle),
            SizedBox(width: 15),
            Icon(CupertinoIcons.bell_fill, color: Colors.white),
            SizedBox(width: 15),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: borderRadiusRY(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
