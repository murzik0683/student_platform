import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/screens/profile_screen.dart';
import 'package:platform/screens/main_screen.dart';
import 'package:platform/screens/user_register_screen.dart';
import 'package:platform/screens/user_register_screen_two.dart';
import 'package:platform/screens/onboarding_screen.dart';
import 'package:platform/screens/nav_bar_screen.dart';
import 'package:platform/screens/chat_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ThemeColors.themeColor,
      ),
      home: const RegisterScreen(),
      routes: {
        '/nav_bar_screen': (context) => const NavBarScreen(),
        '/user_register_screen': (context) => const UserRegister(),
        '/user_register_screen_two': (context) => const UserRegisterTwo(),
        '/onboarding_page': (context) => const OnboardingPage(),
        '/chat': (context) => const ChatPage(),
        '/profile_screen': (context) => const UserProfile(),
        '/register_screen': (context) => const RegisterScreen(),
      },
      initialRoute: '/',
    );
  }
}
