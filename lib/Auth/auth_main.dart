import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_dust_bin/Pages/Dashboard.dart';
import 'package:smart_dust_bin/login/login.dart';


class AuthMainPage extends StatelessWidget {
  const AuthMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Dashbard();
              } else {} 
              return LoginPage();
            })));
  }
}
