import 'package:get/get.dart';
import 'package:insurance_boost/src/features/authentication/models/user_model.dart';
import 'package:insurance_boost/src/repository/authentication_repository/aunthentication_repository.dart';
import 'package:collection/collection.dart';
import 'package:insurance_boost/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Future<UserModel?> getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
      return UserModel(
        fullName: 'Guest User',
        email: 'guest@example.com',
        phoneNo: '',
        password: '',
      );
    }}

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }
}