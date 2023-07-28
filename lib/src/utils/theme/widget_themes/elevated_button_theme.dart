import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/colors.dart';
import 'package:insurance_boost/src/constants/sizes.dart';

//light & dark elevated button theme
class TElevatedTheme {

  TElevatedTheme._();

  //light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight)
    )
  );

  //dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight)
    )
  );

}