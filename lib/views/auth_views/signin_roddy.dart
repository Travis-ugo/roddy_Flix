import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roddy/model/dimensions.dart';
import 'package:roddy/utils/roddy_colors.dart';
import 'package:roddy/widgets/input_text.dart';
import 'package:roddy/widgets/roddy_footer.dart';

class SignInToRoddy extends StatelessWidget {
  const SignInToRoddy({Key? key}) : super(key: key);

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
            SizedBox(),
          ],
        ),
      ),
      body: Column(
        children: [
          context.isScreenLarge() ? mobileView(context) : wildView(context),
          footer(context),
        ],
      ),
    );
  }
}

// footer(context),
Widget mobileView(context) {
  return Column(
    children: [
      Text('Sign In'),
      inputTextField(),
      inputTextField(),
      expandedButton(() {}),
      Text.rich(
        TextSpan(
          text:
              "This page is protected by Google reCAPTCHA to ensure you're not a bot.",
          children: <TextSpan>[
            TextSpan(
                text: 'Learn more.',
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
      ),
      Text.rich(
        TextSpan(
          text: "New to Netflix? ",
          children: <TextSpan>[
            TextSpan(
                text: 'Sign up now.',
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CheckboxListTile(
            title: Text('Remember me'),
            checkColor: Colors.white,
            value: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (bool? value) {},
          ),
          Text('Need help?'),
        ],
      ),
    ],
  );
}

Widget expandedButton(Function()? onPressed) {
  return RawMaterialButton(
    elevation: 0.0,
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
    onPressed: onPressed,
    // shape: shape(context),
    fillColor: Colors.red,
    child: Text(
      'sign in',
      style: TextStyle(
        fontSize: 17.0,
        color: RoddyColors.white,
      ),
    ),
    // Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Expanded(
    //       child: Padding(
    //         padding:
    //             const EdgeInsets.symmetric(horizontal: 25.0, vertical: 3),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             // leading ?? Container(),
    //             SizedBox(width: 15),
    //             Text(
    //               label,
    //               style: TextStyle(
    //                 fontSize: 17.0,
    //                 color: texColor ?? textColor(context),
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    // ],
    // ),
  );
}

Widget wildView(BuildContext context) {
  return Container(
    height: context.screenHeight(.20),
    width: context.screenWidth(.20),
    color: Colors.black.withOpacity(.4),
    child: mobileView(context),
  );
}
