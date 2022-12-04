import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_dust_bin/shared_componets/buttons.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
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
                onPressed: () {
                  Get.toNamed('/login', arguments: 'user');
                },
                text: 'User Login',
              ),
              const SizedBox(
                height: 20,
              ),
              buttonWidget(
                onPressed: () {
                  Get.toNamed('/login', arguments: 'collector');
                },
                text: 'Collector Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
