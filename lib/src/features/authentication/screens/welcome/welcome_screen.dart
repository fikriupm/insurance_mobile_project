import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_boost/src/constants/sizes.dart';
import 'package:insurance_boost/src/features/authentication/screens/login/login_screen.dart';
import 'package:insurance_boost/src/features/authentication/screens/sign%20up/signup_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      // backgroundColor: Color.fromARGB(255, 141, 188, 250), // Set the background color to blue
      // backgroundColor: isDarkMode ? Color.fromARGB(255, 31, 35, 39) : Color.fromARGB(255, 141, 188, 250), // Set background color based on dark mode
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        alignment: Alignment.center, // Align content at the center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            // Add App Logo Here
            Image(
              image: const AssetImage(tWelcomeScreenImage),
              height: height * 0.3, // Increase logo size
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  tWelcomeSubTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Customize the Login Button
                OutlinedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  style: OutlinedButton.styleFrom(
                    // primary: Colors.white, // Custom button color
                    side: BorderSide(width: 2, color: Colors.white), // Add a border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Round the edges
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Increase button size
                  ),
                  child: Text(
                    tLogin.toUpperCase(),
                    // style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 20),
                // Customize the SignUp Button
                ElevatedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.transparent, // Transparent button background
                    side: BorderSide(width: 2, color: Colors.white), // Add a border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Round the edges
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Increase button size
                  ),
                  child: Text(
                    tSignup.toUpperCase(),
                    // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
