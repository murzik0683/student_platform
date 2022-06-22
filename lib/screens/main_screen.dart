import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/widgets/text_button_big.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    getValidation();
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    var validationEmail = storage.getString('email_key');
    var validationPassword = storage.getString('password_key');

    if (_emailController.text == validationEmail &&
        _passwordController.text == validationPassword) {
      Navigator.of(context).pushReplacementNamed('/nav_bar_screen');
      return Fluttertoast.showToast(
          msg: 'Login Successful',
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white);
    } else {
      _emailController.clear();
      _passwordController.clear();
      return Fluttertoast.showToast(
        msg: 'Login Invalid',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: 280,
        height: 250,
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
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            label: Text('E-mail'),
          ),
          validator: (value) {
            if (value!.isEmpty) return 'Please enter your E-mail';
            return null;
          },
        ),
        _buildSpacer(15),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
                  Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            ),
            prefixIcon: const Icon(Icons.vpn_key),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            label: const Text('Password'),
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
    return TextButtonBig(
      title: 'Enter',
      fun: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            getValidation();
          });
        }
      },
    );
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
