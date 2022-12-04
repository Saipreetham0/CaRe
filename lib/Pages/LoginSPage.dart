import 'package:flutter/material.dart';
import 'package:smart_dust_bin/login/login.dart';
import 'package:smart_dust_bin/login/signup_page.dart';
import 'package:smart_dust_bin/shared_componets/buttons.dart';

class LoginS extends StatefulWidget {
  LoginS({Key? key}) : super(key: key);

  @override
  State<LoginS> createState() => _LoginSState();
}

class _LoginSState extends State<LoginS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/recycle-bin.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "C A R E",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            buttonWidget(
                text: 'Login',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
            const SizedBox(height: 20),
            buttonWidget(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                }),
          ],
        ),
      ),
    );
  }
}
