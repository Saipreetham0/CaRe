import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:smart_dust_bin/Pages/Dashboard.dart';
import 'package:smart_dust_bin/Pages/LoginSPage.dart';
import 'package:smart_dust_bin/Splash_Screen_Page.dart';
import 'package:smart_dust_bin/login/login.dart';
import 'package:smart_dust_bin/login/signup_page.dart';
import 'package:smart_dust_bin/login/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return GetMaterialApp(
            title: 'Smart Dust Bin',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const Splash(),
            routes: {
              '/login': (context) => LoginPage(),
              '/signup': (context) => SignUpPage(),
              // '/forgotpassword': (context) =>  f(),
              '/dashboard': (context) => Dashbard(),
              '/welcome': (context) => welcomeScreen(),
              '/loginS': (context) => LoginS(),
            },
          );
        });
  }
}
