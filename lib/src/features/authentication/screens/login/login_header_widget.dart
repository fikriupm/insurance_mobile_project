import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/image_strings.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.08), // Add spacing between top edge and logo
        Image(
          image: const AssetImage(tWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        SizedBox(height: 16), // Add spacing between logo and title
        Text(
          tLoginTitle,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8), // Add spacing between title and subtitle
        Text(
          tLoginSubTitle,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600], // Use a subtle color for the subtitle
          ),
        ),
        SizedBox(height: 24), // Add additional spacing at the bottom
      ],
    );
  }
}
