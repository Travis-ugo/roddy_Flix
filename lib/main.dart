import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roddy/utils/roddy_colors.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // supportedLocales:,
      theme: ThemeData(
        primaryColor: RoddyColors.primaryColor,
        useMaterial3: true,
        typography: Typography(
          white: TextTheme(),
        ),
      ),

      home: SportCar(),
    );
  }
}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

class SportCar extends ConsumerWidget {
  const SportCar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text('Holly Molly'),
    );
  }
}
