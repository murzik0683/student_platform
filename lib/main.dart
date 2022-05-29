import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/screens/first_screen.dart';
import 'package:platform/screens/register_screen.dart';
import 'package:platform/screens/user_register_screen.dart';
import 'package:platform/widgets/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ThemeColors.themeColor,
      ),
      routes: {
        '/first_screen': (context) => const UserCalendar(),
        '/user_register_screen': (context) => const UserRegister(),
        '/onboarding_page': (context) => const OnboardingPage(),
      },
      initialRoute: '/',
      home: const RegisterScreen(),
    );
  }
}
