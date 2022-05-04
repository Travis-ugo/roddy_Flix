import 'package:flutter/material.dart';
import 'package:roddy/model/roddy_movie.dart';
import 'package:roddy/utils/dimensions.dart';
import 'package:roddy/widgets/button.dart';
import 'package:roddy/widgets/select_profile_box.dart';

class WhoIsWatching extends StatelessWidget {
  const WhoIsWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 28, 28),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Who's watching?",
              style: TextStyle(
                color: Colors.grey[50],
                fontSize: context.screenWidth(.04),
              ),
              textAlign: TextAlign.center,
            ),
            // StreamBuilder<RoddyMovies>(
            //   builder: (context, snapshot) {
            //     return SelectProfileBox();
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Wrap(
                children: [for (var i = 0; i < 5; i++) SelectProfileBox()],
                alignment: WrapAlignment.center,
              ),
            ),
            filledButton(context),
          ],
        ),
      ),
    );
  }
}
