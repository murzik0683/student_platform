import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

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
          decoration: const InputDecoration(
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
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(350, 55),
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(ThemeColors.themeColor),
        overlayColor: MaterialStateProperty.all(CustomColors.greyColor),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            Navigator.of(context).pushNamed('/first_screen');
            //Navigator.of(context).pushReplacementNamed('/first_screen');
          });
        }
      },
      child: const Text(
        'Enter',
        style: TextStyle(color: CustomColors.whiteColor, fontSize: 22),
      ),
    );
  }

  Widget _buildTextRegister() {
    return InkWell(
      overlayColor: MaterialStateProperty.all(CustomColors.greyColor),
      child: const SizedBox(
        child: Text(
          'Do not have an Account? Register Here',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/onboarding_page');
      },
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
