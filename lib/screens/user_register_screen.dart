import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:platform/widgets/social_network_button_big.dart';
import 'package:platform/widgets/text_button_big.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  bool _obscureText = true;
  bool _obscureTextTwo = true;

  void register() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString('name_key', nameController.text);
    storage.setString('password_key', passwordController.text);
    storage.setString('email_key', emailController.text);
  }

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
              _buildSpacer(),
              _buildTextFiledName(),
              _buildSpacer(),
              _buildTextFiledPhone(),
              _buildSpacer(),
              _buildTextFiledEmail(),
              _buildSpacer(),
              _buildTextFiledPassword(),
              _buildTextButton(),
              _buildSpacer(space: 20),
              _buildText(),
              _buildSpacer(),
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
      textCapitalization: TextCapitalization.sentences,
      controller: nameController,
      decoration: _inputDecoration(
        'Ваше имя',
      ),
      validator: (value) {
        if (value!.isEmpty) return 'Введите Ваше имя';
        return null;
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
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildTextFiledEmail() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration('E-mail'),
      validator: (value) {
        if (value!.isEmpty) return 'Введите E-mail';
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) return 'Введите корректный E-mail';
        return null;
      },
    );
  }

  Widget _buildTextFiledPassword() {
    return Column(
      children: [
        TextFormField(
          controller: passwordController,
          obscureText: _obscureText,
          key: _passwordFieldKey,
          decoration: _inputDecoration(
            'Пароль',
            InkWell(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) return 'Введите пароль';
            if (value.length < 6) return 'Слишком короткий пароль';
            return null;
          },
        ),
        _buildSpacer(),
        TextFormField(
          obscureText: _obscureTextTwo,
          decoration: _inputDecoration(
              'Повторите пароль',
              InkWell(
                onTap: () {
                  setState(() {
                    _obscureTextTwo = !_obscureTextTwo;
                  });
                },
                child: Icon(
                    _obscureTextTwo ? Icons.visibility_off : Icons.visibility),
              )),
          validator: (value) {
            if (value != _passwordFieldKey.currentState!.value) {
              return 'Пароль не совпадает';
            }
            return null;
          },
        ),
        _buildSpacer(space: 20),
      ],
    );
  }

  Widget _buildTextButton() {
    return TextButtonBig(
        title: 'Зарегистрироваться',
        fun: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              register();
              Navigator.of(context)
                  .pushReplacementNamed('/user_register_screen_two');
            });
          }
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
          SocialNetworkButtonBig(
            tag: 1,
            image: 'assets/images/icon_facebook.png',
            fun: () {},
          ),
          SocialNetworkButtonBig(
              tag: 2, image: 'assets/images/icon_vk.png', fun: () {}),
          SocialNetworkButtonBig(
              tag: 3,
              image: 'assets/images/icon_odnoklassniki.png',
              fun: () {}),
        ],
      ),
    );
  }
}

Widget _buildSpacer({double space = 10}) {
  return SizedBox(
    height: space,
  );
}

InputDecoration _inputDecoration(String hintText, [Widget? child]) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: child,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
