import 'package:flutter/material.dart';

class UserCalendar extends StatelessWidget {
  const UserCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Личный календарь планировщик'),
      ),
    );
  }
}
