import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/screens/user_dialogue_chat.dart';
import 'package:platform/screens/user_register_screen.dart';
import 'package:platform/screens/user_register_screen_two.dart';
import 'package:platform/widgets/onboarding_page.dart';
import 'package:platform/screens/main_screen.dart';
import 'package:platform/screens/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ThemeColors.themeColor,
      ),
      home: const MainScreen(),
      routes: {
        '/first_screen': (context) =>const  MainScreen(),
        '/user_register_screen': (context) => const UserRegister(),
        '/user_register_screen_two': (context) => const UserRegisterTwo(),
        '/user_message_chats': (context) => const UserDialogueChats(),
        '/onboarding_page': (context) => const OnboardingPage(),
        '/chat': (context) => const ChatPage(),
      },
      initialRoute: '/',
    );
  }
}
