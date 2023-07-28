import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_boost/src/constants/sizes.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';
import 'package:insurance_boost/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:insurance_boost/src/features/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';

class ForgetPasswordScreen {
   static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {

    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.headline2),
            Text(tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 5.0),
            ForgetPasswordButtonWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: tEmail,
              subTitle: tResetViaEMail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 5.0),
            ForgetPasswordButtonWidget(
              onTap: () {
                // Navigator.pop(context);
                // Get.to(() => const ForgetPasswordMailScreen());
              },
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}