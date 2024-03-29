import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_dust_bin/Pages/Dashboard.dart';
import 'package:smart_dust_bin/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_dust_bin/shared_componets/buttons.dart';

import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Password icon obscurceText
  bool passwordObscureText = true;

  final _formKey = GlobalKey<FormState>();
  var name = "";
  var mobile = "";
  var email = "";
  var password = "";
  var confirmPassword = "";

  final role = Get.arguments;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // categoryController.dispose();
    super.dispose();
  }

  // Future addUserDetails(
  //     String name, String mobile, String email, String category) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'name': name,
  //     'mobile': mobile,
  //     'email': email,
  //     'category': category,
  //   });
  // }

  navigationHomeScreen() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Dashbard(),
      ),
    );

    // if (_selected == "Student") {
    //   // Navigator.pushReplacement(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => StudentProfilePage(),
    //   //   ),
    //   // );
    // } else if (_selected == "Startup") {
    //   // Navigator.pushReplacement(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => industryProfilePage(),
    //   //   ),
    //   // );
    // } else if (_selected == "Teacher") {
    //   // Navigator.pushReplacement(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => teacherProfilePage(),
    //   //   ),
    //   // );
    // } else if (_selected == "Alumin") {
    //   // Navigator.pushReplacement(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => AluminProfilePage(),
    //   //   ),
    //   // );
    // }
    //  else if (_selected == "Alumin") {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => AluminProfilePage(),
    //     ),
    //   );
    // }
  }

  final uid = "";

  final user = FirebaseAuth.instance.currentUser;

  registration() async {
    if (password == confirmPassword) {
      try {
        // UserCredential userCredential = await
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set({
            'name': name,
            'email': email,
            'mobile': mobile,
            'role': role,
            //'category': _selected,
          });
        });

        await user?.updateDisplayName(name);

        //print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            content: Text(
              "Registered Successfully.",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        );
        // FirebaseAuth.instance.authStateChanges().listen((User? user) {
        //   if (user != null) {
        //     print(user.uid);
        //     navigationHomeScreen(user.uid.toString());
        //   }
        // });

        navigationHomeScreen();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/form.png',
                  height: 130,
                  width: 100,
                ),
                const Text(
                  'Create a New Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //name text controller

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //email text controller
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //mobile number
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: mobileController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                      //errorText: 'Error message',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Mobile Number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passwordObscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',

                      //errorText: 'Error message',
                      border: const OutlineInputBorder(),
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 15),

                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordObscureText = !passwordObscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //confirm text controller
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: passwordObscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),

                      border: OutlineInputBorder(),

                      // suffixIcon: Icon(
                      //   Icons.error,
                      // ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'By Signing up, you\'re agree to our ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(
                                'https://saipreetham.me',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('and '),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(
                                'https://saipreetham.me',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                buttonWidget(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                          name = nameController.text;
                          mobile = mobileController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;
                        });
                        registration();
                      }
                    }),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       if (_formKey.currentState!.validate()) {
                //         setState(() {
                //           email = emailController.text;
                //           name = nameController.text;
                //           mobile = mobileController.text;
                //           password = passwordController.text;
                //           confirmPassword = confirmPasswordController.text;
                //         });
                //         registration();
                //       }
                //     },
                //     child: Container(
                //         padding: const EdgeInsets.all(20),
                //         decoration: BoxDecoration(
                //           color: Colors.blue[300],
                //           borderRadius: BorderRadius.circular(15),
                //         ),
                //         child: const Center(
                //           child: Text('Sign Up',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 18,
                //               )),
                //         )),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Joined Us Before?',
                      style: TextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: const Text(
                        ' Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
