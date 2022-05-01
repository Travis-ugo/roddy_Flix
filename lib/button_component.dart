import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Widget button(context) {
  // double height;
  // if (MediaQuery.of(context).size.width > 600) {
  //   height = 3;
  // } else {
  //   height = 10;
  // }
  return Container(
    height: MediaQuery.of(context).size.width > 600 ? 50 : 140,
    width: MediaQuery.of(context).size.width > 600 ? 50 : 140,
  );
}

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: button(context),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /** Change to `ThemeMode.system` and `GBTheme.light` once agreed on theme */

      // home: Countable(),
    );
  }
}
