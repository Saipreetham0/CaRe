import 'package:flutter/material.dart';

class contactUsScreen extends StatefulWidget {
  const contactUsScreen({super.key});

  @override
  State<contactUsScreen> createState() => _contactUsScreenState();
}

final name = TextEditingController();
final email = TextEditingController();
final message = TextEditingController();

class _contactUsScreenState extends State<contactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  // style: const TextStyle(height: ),
                  controller: message,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                  ),
                  maxLines: 5, // <-- SEE HERE
                  minLines: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child:
                          const Text('Submit', style: TextStyle(fontSize: 20))),
                ),
              ],
            ),
          ),
        ));
  }
}
