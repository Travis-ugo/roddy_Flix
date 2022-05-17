import 'package:flutter/material.dart';
import 'package:roddy/model/dimensions.dart';
import 'package:roddy/utils/roddy_colors.dart';
import 'package:roddy/widgets/roddy_footer.dart';

class FinishSettingUpYourAccount extends StatelessWidget {
  const FinishSettingUpYourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 100,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'roddyFlix',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            Text(
              'Sign in',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 150),
            height: 320,
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: context.isScreenLarge()
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text('STEP 1 OF 3'),
                Text(
                  'Finish setting up your account',
                  textAlign: context.isScreenLarge()
                      ? TextAlign.center
                      : TextAlign.start,
                ),
                Text(
                  'Netflix is personalized for you. Create a password to watch on any device at any time.',
                  textAlign: context.isScreenLarge()
                      ? TextAlign.center
                      : TextAlign.start,
                ),
                SizedBox(height: 20),
                Center(
                  child: MaterialButton(
                    elevation: 0.0,
                    child: Text(
                      'Next',
                      style: TextStyle(color: RoddyColors.white, fontSize: 24),
                    ),
                    onPressed: () {},
                    padding:
                        EdgeInsets.symmetric(horizontal: 145, vertical: 27),
                    color: RoddyColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          footer(context),
        ],
      ),
    );
  }
}
