import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roddy/utils/roddy_colors.dart';
import 'package:roddy/views/auth_views/finish_setting_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDQVzPOKcTijwQ3x7EW7EAfpUbU3M3O2OI",
      authDomain: "roddy-f3546.firebaseapp.com",
      projectId: "roddy-f3546",
      storageBucket: "roddy-f3546.appspot.com",
      messagingSenderId: "60817574842",
      appId: "1:60817574842:web:4032884970919282e66b83",
      measurementId: "G-F6TJ3E2TLW",
    ),
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColor: Color.fromARGB(255, 45, 44, 44),
      ),
      debugShowCheckedModeBanner: false,
      // supportedLocales:,
      theme: ThemeData(
        primaryColor: RoddyColors.primaryColor,
        useMaterial3: true,
        typography: Typography(
          white: TextTheme(),
        ),
      ),
      home: FinishSettingUpYourAccount(),
    );
  }
}
