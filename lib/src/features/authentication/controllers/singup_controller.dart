import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_boost/src/features/authentication/models/user_model.dart';
import 'package:insurance_boost/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:insurance_boost/src/repository/authentication_repository/aunthentication_repository.dart';
import 'package:insurance_boost/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


final userRepo = Get.put(UserRepository());

  /// This func will be used to register user with [EMAIL] & [Password]
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }


  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());

  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();


//   //TextField Controllers to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();


//   //Call this Function from Design & it will do the rest
//   void registerUser(String email, String password) {
//     AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

    // String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    // if(error != null) {
    //   Get.showSnackbar(GetSnackBar(message: error.toString(),));
    // }
//   }
// }