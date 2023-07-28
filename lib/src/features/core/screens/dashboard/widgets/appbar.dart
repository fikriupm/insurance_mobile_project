import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insurance_boost/src/constants/colors.dart';
import 'package:insurance_boost/src/constants/image_strings.dart';
import 'package:insurance_boost/src/constants/sizes.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';
import 'package:insurance_boost/src/features/core/screens/profile/profile_screen.dart';


class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
     leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      title: Text(tAppName, style: Theme.of(context).textTheme.headline6),
      centerTitle: true,
      elevation: 0,
      backgroundColor: isDark ? Colors.black : Color.fromARGB(255, 255, 255, 255),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            icon: const Image(image: AssetImage(tUserProfileImage)),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}

