import 'package:flutter/material.dart';
import 'package:platform/widgets/text_button_big.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? name;
  String? birthDay;
  String? email;

  @override
  void initState() {
    super.initState();
    getLogin();
  }

  void getLogin() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      name = storage.getString('name_key');
      birthDay = storage.getString('birth_key');
      email = storage.getString('email_key');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Личный профиль'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildAvatar(),
              _buildSpacer(),
              _buildName(),
              _buildSpacer(),
              _buildBirth(),
              _buildSpacer(),
              _buildEmail(),
              _buildSpacer(),
              _buildExit()
            ],
          ),
        ));
  }

  Widget _buildAvatar() {
    return const Center(
      child: CircleAvatar(
        radius: 55,
        child: Icon(
          Icons.person_outline,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      'Имя: $name',
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _buildBirth() {
    return Text(
      'Дата рождения: $birthDay',
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _buildEmail() {
    return Text(
      'Email: $email',
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _buildExit() {
    return TextButtonBig(
      fun: () async {
        setState(() {
          Navigator.of(context).pushReplacementNamed('/register_screen');
        });
        final SharedPreferences storage = await SharedPreferences.getInstance();
        //storage.clear();
      },
      title: 'Выйти',
    );
  }
}

Widget _buildSpacer({double space = 20}) {
  return SizedBox(
    height: space,
  );
}
