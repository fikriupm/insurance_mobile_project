
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_boost/src/features/authentication/models/user_model.dart';
import 'package:collection/collection.dart';


class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  //1. store user in firebase
  createUser(UserModel user) async {
    
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar("Success", 
      "Your account has been created", 
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      
        Get.snackbar("Error", 
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red );
      
      // ignore: avoid_print
      print("ERROR - $error");

      }); 
  }
      //2. fetch all users or user details
    Future<UserModel?> getUserDetails(String email) async {
    
      final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).firstOrNull;
      return userData;
    }
      
    Future<List<UserModel>> allUser() async {
      final snapshot = await _db.collection("Users").get();
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      return userData;
    }
}