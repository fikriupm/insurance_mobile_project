import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/dashboard.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/rewards/rewards.dart';
import 'package:insurance_boost/src/features/core/screens/pdf/pdf_screen.dart';
import 'package:insurance_boost/src/features/core/screens/profile/profile_screen.dart';
import 'package:line_icons/line_icons.dart'; // Import the LineIcons class

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0; // Maintain the index of the currently selected tab

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          curve: Curves.easeOutExpo,
          gap: 8,
          iconSize: 20,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Get.to(() => const Dashboard());
              },
            ),
            GButton(
              icon: LineIcons.file,
              text: 'Policies',
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Get.to(() => const PdfScreen());
              },
            ),
            GButton(
              icon: LineIcons.gift,
              text: 'Rewards',
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Get.to(() => DashBoardPage());
              },
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Get.to(() => const ProfileScreen());
              },
            ),
          ],
          selectedIndex:
              _selectedIndex, // Set the selectedIndex to the currently selected tab
        ),
      ),
    );
  }
}
