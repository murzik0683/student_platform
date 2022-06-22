import 'package:platform/helpers/colors.dart';
import 'package:platform/screens/chat_screen.dart';
import 'package:platform/screens/calendar_screen.dart';
import 'package:platform/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:platform/screens/user_register_screen_two.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);
  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const UserProfile(),
    const UserCalendar(),
    const ChatPage(),
    const UserRegisterTwo(),
  ];
  final List<Widget> screensName = [
    const Text('Profile'),
    const Text('Calendar'),
    const Text('Chat'),
    const Text('Register'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: CustomColors.greyColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() => selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Calendar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Register')
          ],
        ));
  }
}
