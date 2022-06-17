import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:platform/widgets/widgets.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  late String _name;
  late String _phoneNumber;
  late String _eMail;
  late String _password;
  late String _conformPassword;
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              _buildAvatar(),
              _buildSpacer(10),
              _buildTextFiledName(),
              _buildSpacer(10),
              _buildTextFiledPhone(),
              _buildSpacer(10),
              _buildTextFiledEmail(),
              _buildSpacer(10),
              _buildTextFiledPassword(),
              _buildTextButton(),
              _buildSpacer(20),
              _buildText(),
              _buildSpacer(10),
              _buildSocialNetwork(),
            ]),
          ),
        ),
      ),
    );
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

  Widget _buildTextFiledName() {
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(hintText: 'Ваше имя'),
      validator: (value) {
        if (value!.isEmpty) return 'Введите Ваше имя';
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildTextFiledPhone() {
    PhoneNumber number = PhoneNumber(isoCode: 'NG');
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig:
          const SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
      hintText: 'Телефон',
      errorMessage: 'Введите корректный номер телефона',
      initialValue: number,
    );
  }

  Widget _buildTextFiledEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(hintText: 'E-mail'),
      validator: (value) {
        if (value!.isEmpty) return 'Введите E-mail';
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) return 'Введите корректный E-mail';
        return null;
      },
      onSaved: (value) {
        _eMail = value!;
      },
    );
  }

  Widget _buildTextFiledPassword() {
    final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
    return Column(
      children: [
        TextFormField(
          obscureText: true,
          key: _passwordFieldKey,
          decoration: const InputDecoration(hintText: 'Пароль'),
          validator: (value) {
            if (value!.isEmpty) return 'Введите пароль';
            if (value.length < 6) return 'Слишком короткий пароль';
            return null;
          },
          onSaved: (value) {
            _password = value!;
          },
        ),
        _buildSpacer(10),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Повторите пароль'),
          validator: (value) {
            if (value != _passwordFieldKey.currentState!.value) {
              return 'Пароль не совпадает';
            }
            return null;
          },
          onSaved: (value) {
            _conformPassword = value!;
          },
        ),
        _buildSpacer(20),
      ],
    );
  }

  Widget _buildTextButton() {
    return textButton('Зарегистрироваться', () {
      if (_formKey.currentState!.validate()) {
        setState(() {
          Navigator.of(context)
              .pushReplacementNamed('/user_register_screen_two');
        });
      }
      _formKey.currentState!.save();
    });
  }

  Widget _buildText() {
    return const Center(
      child: Text(
        'Или продолжить через:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSocialNetwork() {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          floatButton(1, 'assets/images/icon_facebook.png', () {}),
          floatButton(2, 'assets/images/icon_vk.png', () {}),
          floatButton(3, 'assets/images/icon_odnoklassniki.png', () {}),
        ],
      ),
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
