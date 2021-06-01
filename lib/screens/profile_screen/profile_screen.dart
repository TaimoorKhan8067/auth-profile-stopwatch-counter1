import 'package:flutter/material.dart';
import 'package:interviewtask/screens/home_screen/home_screen.dart';
import 'package:interviewtask/screens/widgets/customize_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;

  String? email;

  String? password;

  void initState() {
    _loadText();
    super.initState();
  }

  Future<void> _loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => {
          name = prefs.getString('name') ?? '',
          email = prefs.getString('email') ?? '',
          password = prefs.getString('password') ?? '',
        });
  }

  void _mainscreen() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(children: [
              const Text(
                'Name : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                name!,
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
            ]),
            Wrap(children: [
              const Text(
                'Email : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                email!,
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
            ]),
            Wrap(children: [
              const Text(
                'Password : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                password!,
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomizeButton(
                title: 'MainScreen',
                onClick: _mainscreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
