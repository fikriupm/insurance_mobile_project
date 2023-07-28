import 'package:flutter/material.dart';
import 'package:insurance_boost/src/common_widgets/form/form_header_widget.dart';
import 'package:insurance_boost/src/constants/image_strings.dart';
import 'package:insurance_boost/src/constants/sizes.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';
import 'package:insurance_boost/src/features/authentication/screens/sign%20up/signup_footer_widget.dart';
import 'package:insurance_boost/src/features/authentication/screens/sign%20up/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Form Header with Logo, Title, and Subtitle
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                  // Decrease the title font size to 24
                  titleFontSize: 28,
                ),
                // SizedBox(height: tDefaultSize * 2), // Add spacing between header and form fields
                // SignUp Form with form fields
                SignUpFormWidget(),
                // SizedBox(height: tDefaultSize * 2), // Add spacing between form fields and footer
                // SignUp Footer with "Already have an account?" text
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
