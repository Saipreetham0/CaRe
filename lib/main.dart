import 'package:flutter/material.dart';
import 'package:smart_dust_bin/Auth/auth_main.dart';
// ignore: unused_import
import 'package:smart_dust_bin/Pages/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_dust_bin/Splash_Screen_Page.dart';

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
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            title: 'Smart Dust Bin',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        });
  }
}
