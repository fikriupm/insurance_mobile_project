import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insurance_boost/src/constants/image_strings.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';
import 'package:insurance_boost/src/features/authentication/screens/login/login_screen.dart';
import 'package:insurance_boost/src/features/authentication/screens/sign%20up/signup_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          // onPressed: () {},
           onPressed: () => Get.to(() => const LoginScreen()),

          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: tLogin, style: TextStyle(color: Colors.blue))
          ])),
        )
      ],
    );
  }
}
