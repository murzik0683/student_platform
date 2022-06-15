import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildLogo(),
                _buildLoginForm(),
                _buildTextButton(),
                _buildSpacer(25),
                _buildTextRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: SizedBox(
        width: 280,
        height: 280,
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            label: Text('Login'),
          ),
          validator: (value) {
            if (value!.isEmpty) return 'Please enter your username';
            return null;
          },
        ),
        _buildSpacer(15),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            label: Text('Password'),
          ),
          validator: (value) {
            if (value!.isEmpty) return 'Please enter your password';
            return null;
          },
        ),
        _buildSpacer(15),
      ],
    );
  }

  Widget _buildTextButton() {
    return textButton('Enter', () {
      if (_formKey.currentState!.validate()) {
        setState(() {
          Navigator.of(context).pushReplacementNamed('/first_screen');
        });
      }
    });
  }

  Widget _buildTextRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Do not have an Account?',
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/onboarding_page');
          },
          child: const Text(
            '  Register Here',
            style: TextStyle(
                color: ThemeColors.themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
