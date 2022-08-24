import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_dust_bin/Pages/HomePage.dart';
import 'package:smart_dust_bin/Pages/Reward_list.dart';
import 'package:smart_dust_bin/Pages/scan.dart';

class Dashbard extends StatefulWidget {
  Dashbard({Key? key}) : super(key: key);

  @override
  State<Dashbard> createState() => _DashbardState();
}

class _DashbardState extends State<Dashbard> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomePage(), RewardList()];

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const QRViewExample(),
          ));
        },
        child: Icon(Icons.qr_code_scanner_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.card_giftcard,
                text: 'Rewards',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
