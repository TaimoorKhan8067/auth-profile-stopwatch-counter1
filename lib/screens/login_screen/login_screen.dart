import 'package:flutter/material.dart';
import 'package:interviewtask/screens/login_screen/go_to_signup.dart';
import 'package:interviewtask/screens/profile_screen/profile_screen.dart';
import 'package:interviewtask/screens/widgets/customize_button.dart';
import 'package:interviewtask/screens/widgets/customize_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _loginPage() async {
    FocusScope.of(context).unfocus();
    if (_globalKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString('email') == _email.text &&
          prefs.getString('password') == _password.text) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          ProfileScreen.routeName,
          (route) => false,
        );
      } else {
        Fluttertoast.showToast(
            msg: "Email Or Password is Incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                const SizedBox(height: 10),
                CustomizeTextFormField(controller: _email, hint: 'Email'),
                CustomizeTextFormField(
                  controller: _password,
                  hint: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                CustomizeButton(
                  title: 'Login',
                  onClick: _loginPage,
                ),
                const SizedBox(height: 10),
                GoToSignup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
