import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roddy/utils/roddy_colors.dart';
import 'package:roddy/widgets/input_text.dart';

class CreateRoddyAccount extends StatelessWidget {
  const CreateRoddyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create a password to start your membership'),
        Text("Just a few more steps and you're done!"),
        Text('We hate paperwork, too.'),
        inputTextField(),
        inputTextField(),
        CheckboxListTile(
          title: Text('Please do not email me Netflix special offers'),
          checkColor: Colors.grey[900],
          value: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onChanged: (bool? value) {},
        ),
        Center(
          child: MaterialButton(
            elevation: 0.0,
            child: Text(
              'Next',
              style: TextStyle(color: RoddyColors.white, fontSize: 24),
            ),
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 145, vertical: 27),
            color: RoddyColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}

Widget chooseYourPlan() {
  return Column(
    children: [
      Icon(
        CupertinoIcons.check_mark_circled,
      ),
      Text('STEP 2 OF 3'),
      Text('Choose your plan.'),
      ListTile(
        leading: Icon(
          CupertinoIcons.check_mark,
        ),
        title: Text('No commitments, cancel anytime.'),
      ),
      ListTile(
        leading: Icon(
          CupertinoIcons.check_mark,
        ),
        title: Text('Everything on Netflix for one low price.'),
      ),
      ListTile(
        leading: Icon(
          CupertinoIcons.check_mark,
        ),
        title: Text('No ads and no extra fees. Ever.'),
      ),
    ],
  );
}
