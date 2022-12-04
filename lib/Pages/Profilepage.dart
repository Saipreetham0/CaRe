import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_dust_bin/Pages/LoginSPage.dart';
import 'package:smart_dust_bin/Pages/contactUs.dart';
import 'package:smart_dust_bin/Pages/widgets/profile_list_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  var name = '';
  var email = '';
  var phone = '';

  String urlImage = "";

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  Future getData() async {
    await db.collection('users').doc(user!.uid).get().then((value) {
      setState(() {
        name = value['name'];
        email = value['email'];
        phone = value['phone'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Profile Page',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '${name}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '\n${user!.email}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.normal)),
                      ])),
                    ]),
              ),
              profileListViewWidget(
                icon: Icons.info,
                onTap: () {
                  // Get.to(() => const profileEdit());
                },
                text: 'About Us',
              ),
              profileListViewWidget(
                icon: Icons.info_outline_sharp,
                onTap: () {
                  // Get.to(() => const profileEdit());
                },
                text: 'App Information',
              ),
              profileListViewWidget(
                icon: Icons.support,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const contactUsScreen()),
                  );
                },
                text: 'Contact Us',
              ),
              profileListViewWidget(
                onTap: () async {
                  // AuthController.instance.signOut();

                  // logOutScreen.buildShowModalBottomSheet(context);
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginS(),
                      ),
                      (route) => false);
                },
                icon: Icons.logout,
                text: "Logout",
                hasNavigation: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
