import 'dart:async';

// ignore: unused_import

import 'package:flutter/material.dart';

import '../Auth/auth_main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthMainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/Learn-to-earn-logo.png',
            //   height: 200,
            //   width: 200,
            // ),
            Text(
              'C a R e',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      )),
    );
  }
}

//